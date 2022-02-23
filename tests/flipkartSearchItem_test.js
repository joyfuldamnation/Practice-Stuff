Feature('My Flipkart Search Test');

Scenario('Search for item, and opening the cheapest of the top 5 options', ({I}) =>{
    //going to flipkart
    I.amOnPage('/');
    I.waitForElement("//div[@tabindex='-1']", 30);
    //cancelling popups
    I.amCancellingPopups();
    I.click("//div[@tabindex='-1']//button[1]");
    I.waitForElement("//input[@title='Search for products, brands and more']", 30);
    //searching for item
    I.fillField('Search for products, brands and more', 'Apple Watch \n');
    I.wait(5);
    I.click("APPLE Watch Series 3 GPS - MTF02HN/A 38 mm Space Grey Aluminium Case with Black Sport Band");
    I.wait(5);
})