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
    I.amOnPage('http://localhost:8080');
    I.wait(5);
});