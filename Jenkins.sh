APK_PATH="./app/build/outputs/apk/dev/debug"
MONKEY_RESULTS="./tests/Monkey/monkey_results.txt"
ANDROID_AVD_DEVICE=$1
E2E_BDT=$2
VRT=$3
RANDOM=$4
RANDOM_EVENTS=$5
RANDOM_SEED=$6
MUTATION=$7
MUTANTS_NUMBER=$8


mv -f ${APK_PATH}/*.apk ${APK_PATH}/WikipediaAndroid.apk

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
	./appium/yarn run vrt:run
	echo "------- END VRT"
fi

if [ ! ${RANDOM} = "false" ] ; then
	echo "------- START MONKEY"
	rm ${MONKEY_RESULTS}
	touch ${MONKEY_RESULTS}
	$ANDROID_HOME/platform-tools/adb install -r -g ${APK_PATH}/WikipediaAndroid.apk
    $ANDROID_HOME/platform-tools/adb shell am start -n "org.wikipedia.dev/org.wikipedia.main.MainActivity"
	$ANDROID_HOME/platform-tools/adb shell monkey -p org.wikipedia.dev -s ${RANDOM_SEED} -v ${RANDOM_EVENTS} >> ${MONKEY_RESULTS}
	echo "------- END MONKEY"
fi

if [ ! ${MUTATION} = "false" ] ; then
	echo "------- START MUTATION (MUTAPK)"
	git clone https://github.com/TheSoftwareDesignLab/MutAPK.git
	cd MutAPK
	export MAVEN_HOME=/Users/dayanaromero/.jenkins/tools/hudson.tasks.Maven_MavenInstallation/maven
	export PATH=$PATH:$MAVEN_HOME/bin
	mvn clean
	mvn package
	java -jar target/MutAPK-0.0.1.jar ${APK_PATH}/WikipediaAndroid.apk org.wikipedia ./mutants/ ./extra/ . true ${MUTANTS_NUMBER}
	echo "------- END MUTATION MUTAPK"
fi
