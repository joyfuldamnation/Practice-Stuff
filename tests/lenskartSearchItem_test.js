Feature('My Lenskart Search Test');

Scenario('Search for item', ({I}) =>{
    //going to lenskart
    I.amOnPage('https://lenskart.com');
    I.waitForElement("//input[@placeholder='What are you looking for ']", 30);
    I.fillField('What are you looking for ', 'Aviators \n');
    I.wait(10);
    I.click("Vincent Chase Polarized");
    I.wait(10);
})