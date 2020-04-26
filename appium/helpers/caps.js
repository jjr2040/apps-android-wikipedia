const opts = {
  port: 4723,
  host: 'localhost',
  capabilities: {
    platformName: "Android",
    platformVersion: "8",
    deviceName: "Android Emulator",
    // app: "../app/build/outputs/apk/dev/debug/app-dev-debug.apk",
    // appPackage: "io.appium.android.apis",
    appPackage: 'org.wikipedia.dev',
    appActivity: "org.wikipedia.main.MainActivity",
    appWaitActivity: "org.wikipedia.*",
    automationName: "UiAutomator2",
    // avd: 'Nexus_5_API_26'
    // automationName: "Espresso"
  }
};

module.exports = opts;