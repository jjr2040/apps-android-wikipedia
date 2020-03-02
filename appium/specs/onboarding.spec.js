const caps = require('../helpers/caps');
const webdriverio = require('webdriverio');
const selectorById = require('../helpers/utils').selectorById;

jest.setTimeout(30000);

describe('android', () => {

  let client;
  let currentPackage;

  beforeAll(async () => {
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

    expect(text).toBe('New ways to explore');
  });

});