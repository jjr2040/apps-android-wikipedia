const caps = require('../helpers/caps');
const wd = require('webdriverio');

jest.setTimeout(30000);

function selectorById(packageName, id) {
  const resourceId = buildId(packageName, id);
  return `new UiSelector().resourceId("${resourceId}")`;
}

function buildId(packageName , id) {
  return `${packageName}:id/${id}`;
}

describe('android', () => {

  let client;
  let currentPackage;

  beforeAll(async () => {
    client = await wd.remote(caps);
    currentPackage = await client.getCurrentPackage();    
  });

  afterAll( async () => {
    await client.deleteSession();
  });

  test('App has skip button', async () => {

    // const currentPackage = await client.getCurrentPackage();
    
    // expect(currentPackage).toBe('org.wikipedia');

    const resourceId = 'fragment_onboarding_skip_button';
    const selector = selectorById(currentPackage, resourceId); //`new UiSelector().resourceId("${resourceId}")`;

    const button = await client.$(`android=${selector}`);

    // button.click();

    // const button = await client.$({
    //   'name': 'hasEntry',
    //   'args': [ 'resource-id', selector ]
    // });

    const isDisplayed = await button.isDisplayed();
    
    expect(isDisplayed).toBe(false);
  });

  // test('Can search a term', async () => {
  //   const searchContainerResourceId = 'search_container';
  //   const selector = selectorById(currentPackage, searchContainerResourceId);

  //   const searchContainer = await client.$(`android=${selector}`);

  //   searchContainer.click();
  // });

});