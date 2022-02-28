Feature('My pmm start Test');
const { I, loginPage } = inject();
module
Scenario('Startup pmm and log in', ({I, loginPage}) =>{
    //going to pmm and logging in to Dashboard
    I.amOnPage('http://localhost:8080');
    loginPage.login('admin','admin');
    
});