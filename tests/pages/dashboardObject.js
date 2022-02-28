const { I, dashboardPage } = inject();

module.exports = {

  // setting locators
  fields: {
    nameofdb: '#dbdb'
  },

  // introducing methods
  gotoRIP() {
    I.waitForElement("//a//span[text()='PMM']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    },

  RemoteInstanceof(nameofdb) {
    I.amOnPage('http://localhost:8080/graph/add-instance');
    I.waitForElement("//button[@data-testid='mysql-instance']", 30);
    switch (nameofdb) {
      case 'mysql':
        I.click("//button[@data-testid='mysql-instance']");
        I.waitForElement("//input[@placeholder='Hostname']", 30);
        I.fillField('Hostname', 'some-mysql');
        I.fillField('username', 'admin');
        I.fillField('password', 'admin');
        I.click("//button[@id='addInstance']");
        I.waitForElement("//td[text()='MySQL']", 30);
        break;
      case 'mongodb':
        I.click("//button[@data-testid='mongodb-instance']");
        break;
      case 'postgresql':
        I.click("//button[@data-testid='postgresql-instance']");
        I.waitForElement("//input[@placeholder='Hostname']", 30);
        I.fillField('Hostname', 'some-postgres');
        I.fillField('username', 'admin');
        I.fillField('password', 'admin');
        I.click("//button[@id='addInstance']");
        I.waitForElement("//td[text()='PostgreSQL']", 30);
        break;
    }
  }
}