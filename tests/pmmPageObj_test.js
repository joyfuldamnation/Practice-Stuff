const { RemoveEverything } = require("./pages/inventoryObject");

Feature('My pmm page object Test');
const { I, loginPage, dashboardPage, inventoryPage} = inject();
Scenario('Startup pmm making remote instances', ({I}) =>{
    //going to pmm and logging in to Dashboard
    I.amOnPage('http://localhost:8080');
    loginPage.login('admin','admin');
    inventoryPage.RemoveEverything();
    dashboardPage.RemoteInstanceof('mysql');
    dashboardPage.RemoteInstanceof('postgresql');
    inventoryPage.RemoveEverything();
    I.wait(2);
});