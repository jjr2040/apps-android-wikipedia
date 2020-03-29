const fs = require('mz/fs');
const compareImages = require('resemblejs/compareImages');

const buildId = (packageName , id) => {
  return `${packageName}:id/${id}`;
};

const diffImage = async (imageOnePath, imageTwoBuffer) => {
  const options = {
    output: {
      errorColor: {
        red: 255,
        green: 0, 
        blue: 255
      },
      errorType: 'movement',
      transparency: 0.3,
      largeImageThreshold: 1200,
      userCrossOrigin: false,
      outputDiff: true
    },
    scaleToSameSize: true,
    ignore: 'less'
  };

  const imageOne = await fs.readFile(imageOnePath);
  const imageTwo = imageTwoBuffer;

  return compareImages(imageOne, imageTwo, options);
};

exports.selectorById = (packageName, id) => {
  const resourceId = buildId(packageName, id);
  return `android=new UiSelector().resourceId("${resourceId}")`;
};

exports.buildId = buildId;

exports.compareAndSaveScreenshot = async (client, imageName) => {

  const outputScreenshotsDir = './snapshots/';
  const outputScreenshotsPath = outputScreenshotsDir + imageName;
  const diffSnapshotsDir = './snapshots/__diff_snapshots__/';

  if (!fs.existsSync(outputScreenshotsDir)) {
    await fs.mkdir(outputScreenshotsDir, { recursive: true });
  }

  if (fs.existsSync(outputScreenshotsPath)) {

    if (!fs.existsSync(diffSnapshotsDir)) {
      await fs.mkdir(diffSnapshotsDir, { recursive: true });
    }

    const screenshot = await client.takeScreenshot();
    const diffData = await diffImage(outputScreenshotsPath, Buffer.from(screenshot, 'base64'));
    const misMatchPercentage = diffData.misMatchPercentage;

    if ( misMatchPercentage > 0.1 ) {
      await fs.writeFile(diffSnapshotsDir + imageName, diffData.getBuffer());
    }
  } else {
    const screenshot = await client.takeScreenshot();
    await fs.writeFile(outputScreenshotsPath, screenshot, { encoding: 'base64' });
  }

};