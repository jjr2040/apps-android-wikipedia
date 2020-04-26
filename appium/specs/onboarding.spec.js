const caps = require('../helpers/caps');
const webdriverio = require('webdriverio');
const fs = require('mz/fs');
const selectorById = require('../helpers/utils').selectorById;
const compareAndSaveScreenshot = require('../helpers/utils').compareAndSaveScreenshot;

jest.setTimeout(30000);

describe('android', () => {

  let client;
  let currentPackage;

  beforeAll(async () => {
    caps["adbPort"] = `${process.env.ANDROID_AVD_ADB_PORT}`
    caps["avd"] = `${process.env.ANDROID_AVD_DEVICE}`
    caps["app"] = "../app/build/outputs/apk/dev/debug/WikipediaAndroid.apk";
    client = await webdriverio.remote(caps);
    currentPackage = await client.getCurrentPackage();    
  });

  afterAll( async () => {
    await client.deleteSession();
  });

  test('App has skip button', async () => {
    const resourceId = 'fragment_onboarding_skip_button';
    const selector = selectorById(currentPackage, resourceId);

    const button = await client.$(selector);

    const isDisplayed = await button.isDisplayed();

    await compareAndSaveScreenshot(client, 'onboarding-skip-button.png');
    
    expect(isDisplayed).toBe(true);
  });

  test('Can scroll through tutorial', async () => {

    const size = await client.getWindowSize()

    client.touchAction([
      { action: 'press', x: size.width - 50, y: 300 },
      { action: 'moveTo', x: 10, y: 300 },
      'release'
    ]);

    const primaryText = await client.$(selectorById(currentPackage, 'view_onboarding_page_primary_text'));
    const text = await primaryText.getText()

    await compareAndSaveScreenshot(client, 'onboarding-scroll.png');

    expect(text).toBe('New ways to explore');
  });

});