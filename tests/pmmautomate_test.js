Feature('My pmm start Test');

Scenario('Startup pmm and log in', ({I}) =>{
    //going to pmm
    I.amOnPage('http://localhost:8080');
    //login page
    I.waitForElement("//input[@placeholder='email or username']", 30);
    I.fillField('email or username', 'admin');
    I.fillField('password', 'admin');
    I.click('Login button');
    //skipping password reset
    I.waitForElement("//input[@name='newPassword']", 30);
    I.click('Skip change password button');
    //on dashboard
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//div//div//div//div//div//div//div//div//div//div//div//span[text()='Percona Monitoring and Management']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    //on add instance page
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//section//nav//button//span[text()='MySQL']", 30);
    I.click("//body//grafana-app//div//div//react-container//div//div//section//nav//button//span[text()='MySQL']");
    //filling hostname, username, password and submitting for mysql
    I.waitForElement("//input[@placeholder='Hostname']", 30);
    I.fillField('Hostname', '601d4dd15e03');
    I.fillField('username', 'admin');
    I.fillField('password', 'admin');
    I.click("//body//grafana-app//div//div//react-container//div//div//div//form//button//span[text()='Add service']");
    //checking if mysql service is active and going to dashboard
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//div//div//div//div//div//table//tbody//tr//td[text()='MySQL']", 30);
    I.amOnPage('http://localhost:8080');
    //on dashboard
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//div//div//div//div//div//div//div//div//div//div//div//span[text()='Percona Monitoring and Management']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    //on add instance page
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//section//nav//button//span[text()='PostgreSQL']", 30);
    I.click("//body//grafana-app//div//div//react-container//div//div//section//nav//button//span[text()='PostgreSQL']");
    //filling hostname, username, password and submitting for PostgreSQL
    I.waitForElement("//input[@placeholder='Hostname']", 30);
    I.fillField('Hostname', 'fb970d98b63e');
    I.fillField('username', 'admin');
    I.fillField('password', 'admin');
    I.click("//body//grafana-app//div//div//react-container//div//div//div//form//button//span[text()='Add service']");
    //checking if PostgreSQL service is active and going to dashboard
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//div//div//div//div//div//table//tbody//tr//td[text()='PostgreSQL']", 30);
    I.amOnPage('http://localhost:8080');
    //on dashboard
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//div//div//div//div//div//div//div//div//div//div//div//span[text()='Percona Monitoring and Management']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    //on add instance page
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//section//nav//button//span[text()='MongoDB']", 30);
    I.click("//body//grafana-app//div//div//react-container//div//div//section//nav//button//span[text()='MongoDB']");
    //filling hostname, username, password and submitting for MongoDB
    I.waitForElement("//input[@placeholder='Hostname']", 30);
    I.fillField('Hostname', 'some-mongo');
    I.fillField('username', 'pmm_mongodb');
    I.fillField('password', 'secret');
    I.click("//body//grafana-app//div//div//react-container//div//div//div//form//button//span[text()='Add service']");
    //checking if MongoDB service is active and going to dashboard
    I.waitForElement("//body//grafana-app//div//div//react-container//div//div//div//div//div//div//div//table//tbody//tr//td[text()='MongoDB']", 30);
    I.amOnPage('http://localhost:8080');
    I.wait(12);
});