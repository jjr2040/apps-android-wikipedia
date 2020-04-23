APK_PATH="./app/build/outputs/apk/development/debug"
ANDROID_AVD_DEVICE=$1
E2E_BDT=$2
RANDOM=$3
RANDOM_EVENTS=$4
RANDOM_SEED=$5


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

if [ ! ${RANDOM} = "false" ] ; then
	echo "------- START MONKEY"
	rm tests/Monkey/monkey_results.txt
	touch tests/Monkey/monkey_results.txt
	$ANDROID_HOME/platform-tools/adb install -r ${APK_PATH}/WikipediaAndroid.apk
    $ANDROID_HOME/platform-tools/adb shell am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -n "org.wikipedia.dev/org.wikipedia.main.MainActivity"
	$ANDROID_HOME/platform-tools/adb shell monkey -p org.wikipedia.dev -s ${RANDOM_SEED} -v ${RANDOM_EVENTS} >> tests/Monkey/monkey_results.txt
	echo "------- END MONKEY"
fi
