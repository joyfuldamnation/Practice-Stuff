Feature('My pmm start Test');

Scenario('Startup pmm and log in', ({I}) =>{
    //going to indiamart
    I.amOnPage('https://localhost:443');
    I.waitForElement("//input[@placeholder='Enter product/service name']", 30);
    //searching for item