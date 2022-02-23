Feature('My Indiamart Search Test');

Scenario('Search for item and opening the top option', ({I}) =>{
    //going to indiamart
    I.amOnPage('https://indiamart.com');
    I.waitForElement("//input[@placeholder='Enter product/service name']", 30);
    //searching for item
    I.fillField('Enter product/service name', 'industrial shoes\n');
    //I.click('searchBtn');
    I.wait(5);
    I.click("PVC Industrial Safety Shoes");
    I.wait(5);
})