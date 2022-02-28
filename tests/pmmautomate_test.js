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
    I.waitForElement("//button[@aria-label='Skip change password button']", 30);
    I.click('Skip change password button');
    //on dashboard
    I.waitForElement("//a//span[text()='PMM']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    //on add instance page
    I.waitForElement("//button[@data-testid='mysql-instance']", 30);
    I.click("//button[@data-testid='mysql-instance']");
    //filling hostname, username, password and submitting for mysql
    I.waitForElement("//input[@placeholder='Hostname']", 30);
    I.fillField('Hostname', 'some-mysql');
    I.fillField('username', 'admin');
    I.fillField('password', 'admin');
    I.click("//button[@id='addInstance']");
    //checking if mysql service is active and going to dashboard
    I.waitForElement("//td[text()='MySQL']", 30);
    I.amOnPage('http://localhost:8080');
    //on dashboard
    I.waitForElement("//a//span[text()='PMM']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    //on add instance page
    I.waitForElement("//button[@data-testid='postgresql-instance']", 30);
    I.click("//button[@data-testid='postgresql-instance']");
    //filling hostname, username, password and submitting for PostgreSQL
    I.waitForElement("//input[@placeholder='Hostname']", 30);
    I.fillField('Hostname', 'some-postgres');
    I.fillField('username', 'admin');
    I.fillField('password', 'admin');
    I.click("//button[@id='addInstance']");
    //checking if PostgreSQL service is active and going to dashboard
    I.waitForElement("//td[text()='PostgreSQL']", 30);
    I.amOnPage('http://localhost:8080');
    //on dashboard
    /*I.waitForElement("//a//span[text()='PMM']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Add Instance']");
    //on add instance page
    I.waitForElement("//button[@data-testid='mongodb-instance']", 30);
    I.click("//button[@data-testid='mongodb-instance']");
    //filling hostname, username, password and submitting for MongoDB
    I.waitForElement("//input[@placeholder='Hostname']", 30);
    I.fillField('Hostname', 'some-mongo');
    I.fillField('username', 'pmm_mongodb');
    I.fillField('password', 'secret');
    I.click("//button[@id='addInstance']");
    //checking if MongoDB service is active and going to dashboard
    I.waitForElement("//td[text()='MongoDB']", 30);
    I.amOnPage('http://localhost:8080');*/
    //removing everything because its a sin
    I.waitForElement("//a//span[text()='PMM']", 30);
    I.click("//a//span[text()='PMM']");
    I.click("//ul//li//a[text()='PMM Inventory']");
    //On Inventory Page, Removing all Agents
    I.waitForElement("//li[@aria-label='Tab Agents']", 30);
    I.click("//li[@aria-label='Tab Agents']");
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
    //Removing all Services
    I.waitForElement("//li[@aria-label='Tab Services']", 30);
    I.click("//li[@aria-label='Tab Services']");
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
    //Removing all nodes
    I.waitForElement("//li[@aria-label='Tab Nodes']", 30);
    I.click("//li[@aria-label='Tab Nodes']");
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.wait(2);
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
    //going back to dashboard
    I.amOnPage('http://localhost:8080');
});