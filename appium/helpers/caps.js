const opts = {
  port: 4723,
  host: 'localhost',
  capabilities: {
    platformName: "Android",
    platformVersion: "8",
    deviceName: "Android Emulator",
    app: "/Users/jjvillegas/Documents/miso/pruebas/project/wikipedia-android/app/build/outputs/apk/dev/release/app-dev-release.apk",
    // appPackage: "io.appium.android.apis",
    appPackage: 'org.wikipedia.dev',
    appActivity: "org.wikipedia.main.MainActivity",
    appWaitActivity: "org.wikipedia.*",
    automationName: "UiAutomator2",
    avd: 'Pixel_2_API_27'
    // automationName: "Espresso"
  }
};

module.exports = opts;