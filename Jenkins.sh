CWD=${PWD}
APK_PATH="app/build/outputs/apk/dev/debug"
APK_NAME="WikipediaAndroid.apk"
export ANDROID_APK=${CWD}/${APK_PATH}/${APK_NAME}
MONKEY_RESULTS="./tests/Monkey/monkey_results.txt"
ANDROID_AVD_DEVICE=$1
E2E_BDT=$2
VRT=$3
VRT_TRESHOLD=$4
RANDOM=$5
RANDOM_EVENTS=$6
RANDOM_SEED=$7
MUTATION=$8
MUTANTS_NUMBER=$9
OPERATORS=${10}

echo "--------------"
echo "Android device: ${ANDROID_AVD_DEVICE}"
echo "E2E enabled: ${E2E_BDT}"
echo "VRT enabled: ${VRT}"
echo "VRT treshold: ${VRT_TRESHOLD}"
echo "Random enabled: ${RANDOM}"
echo "Random events: ${RANDOM_EVENTS}"
echo "Random seed: ${RANDOM_SEED}"
echo "Mutation enabled: ${MUTATION}"
echo "Number of mutants: ${MUTANTS_NUMBER}"
echo "Mutation operators: ${OPERATORS}"
echo "--------------"

mv -f ${APK_PATH}/*.apk ${ANDROID_APK}

if [ ! ${E2E_BDT} = "false" ] ; then
	echo "------- START BDT (CALABASH/CUCUMBER)"
	gem install bundler
	cd tests/BDT/calabash-wikipedia
	bundle install
	chmod +x scripts/run_android_features
	cd scripts && ./run_android_features -r -d ${ANDROID_AVD_DEVICE}
	cd ../../../..
	echo "------- END BDT (CALABASH/CUCUMBER)"
fi

if [ ! ${VRT} = "false" ] ; then
	echo "------- START VRT"
	cd appium && npm run vrt:run
	cd ..
	echo "------- END VRT"
fi

if [ ! ${RANDOM} = "false" ] ; then
	echo "------- START MONKEY"
	rm ${MONKEY_RESULTS}
	touch ${MONKEY_RESULTS}
	$ANDROID_HOME/platform-tools/adb install -r -g ${ANDROID_APK}
    $ANDROID_HOME/platform-tools/adb shell am start -n "org.wikipedia.dev/org.wikipedia.main.MainActivity"
	$ANDROID_HOME/platform-tools/adb shell monkey -p org.wikipedia.dev -s ${RANDOM_SEED} -v ${RANDOM_EVENTS} >> ${MONKEY_RESULTS}
	echo "------- END MONKEY"
fi

if [ ! ${MUTATION} = "false" ] ; then
	echo "------- START MUTATION (MUTAPK)"
	git clone https://github.com/TheSoftwareDesignLab/MutAPK.git
	cd MutAPK
	echo ${OPERATORS} > operators.properties
	mkdir mutants
	mvn clean
	mvn package
	java -jar target/MutAPK-0.0.1.jar ${ANDROID_APK} org.wikipedia ./mutants/ ./extra/ . true ${MUTANTS_NUMBER}
	echo "------- END MUTATION MUTAPK"
fi
