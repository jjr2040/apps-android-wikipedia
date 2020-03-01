const opts = {
  port: 4723,
  capabilities: {
    platformName: "Android",
    platformVersion: "8",
    deviceName: "Android Emulator",
    // app: "../app/build/outputs/apk/dev/debug/app-dev-debug.apk",
    // appPackage: "io.appium.android.apis",
    appPackage: 'org.wikipedia',
    appActivity: ".main.MainActivity",
    automationName: "UiAutomator2"
  }
};

async function main () {
  const client = await wdio.remote(opts);

  await client.deleteSession();
}

main();
