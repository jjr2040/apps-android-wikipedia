
const buildId = (packageName , id) => {
  return `${packageName}:id/${id}`;
};

exports.selectorById = (packageName, id) => {
  const resourceId = buildId(packageName, id);
  return `android=new UiSelector().resourceId("${resourceId}")`;
};

exports.buildId = buildId;