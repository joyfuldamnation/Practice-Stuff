const { I } = inject();

module.exports = {

  // setting locators
  fields: {
    whattorm: '#dbdb'
  },
  

  // introducing methods
  RemoveAgents(){
    I.amOnPage('http://localhost:8080/graph/inventory/agents');
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
  },

  RemoveServices(){
    I.amOnPage('http://localhost:8080/graph/inventory/services');
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
  },

  RemoveEverything() {
    I.amOnPage('http://localhost:8080/graph/inventory/agents');
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
    I.waitForElement("//li[@aria-label='Tab Services']", 30);
    I.click("//li[@aria-label='Tab Services']");
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
    I.waitForElement("//li[@aria-label='Tab Nodes']", 30);
    I.click("//li[@aria-label='Tab Nodes']");
    I.waitForElement("//div[@data-testid='select-all']", 30);
    I.click("//div[@data-testid='select-all']");
    I.wait(2);
    I.click("//span[text()='Delete']");
    I.waitForElement("//button//span[text()='Proceed']", 30);
    I.click("//button//span[text()='Proceed']");
  }
}