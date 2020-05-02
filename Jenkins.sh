CWD=${PWD}
APK_PATH="app/build/outputs/apk/dev/debug"
APK_NAME="WikipediaAndroid.apk"
export ANDROID_APK=${CWD}/${APK_PATH}/${APK_NAME}
MONKEY_PATH="./tests/Monkey"
MONKEY_NAME="monkey_results.txt"
MONKEY_RESULTS=${MONKEY_PATH}/${MONKEY_NAME}
VRT_DIFF_PATH="appium/snapshots/__diff_snapshots__"
CUCUMBER="tests/BDT/calabash-wikipedia/cucumber.json"
ANDROID_AVD_DEVICE=$1
E2E_BDT=$2
APK_E2E=$3
VRT=$4
export VRT_TRESHOLD=$5
MONKEY=$6
MONKEY_EVENTS=$7
MONKEY_SEED=$8
MUTATION=$9
MUTANTS_NUMBER=${10}
OPERATORS=${11}

echo "--------------"
echo "APK: ${ANDROID_APK}"
echo "Android device: ${ANDROID_AVD_DEVICE}"
echo "E2E enabled: ${E2E_BDT}"
echo "APK for E2E: ${APK_E2E}"
echo "VRT enabled: ${VRT}"
echo "VRT treshold: ${VRT_TRESHOLD}"
echo "Monkey enabled: ${MONKEY}"
echo "Monkey events: ${MONKEY_EVENTS}"
echo "Monkey seed: ${MONKEY_SEED}"
echo "Mutation enabled: ${MUTATION}"
echo "Number of mutants: ${MUTANTS_NUMBER}"
echo "Mutation operators: ${OPERATORS}"

echo "--------------"

mv -f ${APK_PATH}/*.apk ${ANDROID_APK}
rm ${MONKEY_PATH}/*
touch ${MONKEY_RESULTS}
rm ${VRT_DIFF_PATH}/*
rm ${CUCUMBER}

if [ ! ${E2E_BDT} = "false" ] ; then
	if [ ! ${APK_E2E} = ${APK_NAME} ] ; then
	    export ANDROID_APK=${PWD}/MutAPK/mutants/${APK_E2E}/${APK_NAME}
	fi
	
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

if [ ! ${MONKEY} = "false" ] ; then
	echo "------- START MONKEY"
	$ANDROID_HOME/platform-tools/adb install -r -g ${ANDROID_APK}
    $ANDROID_HOME/platform-tools/adb shell am start -n "org.wikipedia.dev/org.wikipedia.main.MainActivity"
	$ANDROID_HOME/platform-tools/adb shell monkey -p org.wikipedia.dev -s ${MONKEY_SEED} -v ${MONKEY_EVENTS} >> ${MONKEY_RESULTS}
	echo "------- END MONKEY"
fi

if [ ! ${MUTATION} = "false" ] ; then
	echo "------- START MUTATION (MUTAPK)"
	git clone https://github.com/TheSoftwareDesignLab/MutAPK.git
	cd MutAPK
	echo -e ${OPERATORS} > operators.properties
	rm -rf mutants
	mkdir mutants
	DIRECTORY=${PWD}/target

	if [ -d "$DIRECTORY" ]; then
	    mvn clean
	    mvn package
	fi
	
	java -jar target/MutAPK-0.0.1.jar ../${APK_PATH}/${APK_NAME} org.wikipedia ./mutants/ ./extra/ . true ${MUTANTS_NUMBER}	
	echo "------- END MUTATION MUTAPK"
fi
