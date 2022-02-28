const { setHeadlessWhen, setCommonPlugins } = require('@codeceptjs/configure');

// turn on headless mode when running with HEADLESS=true environment variable
// export HEADLESS=true && npx codeceptjs run
setHeadlessWhen(process.env.HEADLESS);

// enable all common plugins https://github.com/codeceptjs/configure#setcommonplugins
setCommonPlugins();

exports.config = {
  tests: 'tests/*_test.js',
  output: 'tests/output',
  helpers: {
    Playwright: {
      url: 'https://flipkart.com',
      show: true,
      browser: 'chromium'
    }
  },
  include: {
    I: './steps_file.js',
    loginPage: "./tests/pages/loginObject.js",
    dashboardPage: "./tests/pages/dashboardObject.js",
    inventoryPage: "./tests/pages/inventoryObject.js",
  },
  bootstrap: null,
  mocha: {},
  name: 'Practice-Stuff'
}