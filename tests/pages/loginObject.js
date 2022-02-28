/*module.exports = function() {
    return actor({
  
      login: function(email, password) {
        this.waitForElement("//input[@placeholder='email or username']", 30);
        this.fillField('email or username', email);
        this.fillField('password', password);
        this.click('Login button');
        this.waitForElement("//button[@aria-label='Skip change password button']", 30);
        this.click('Skip change password button');
      }
    });
  }*/

  const { I, loginPage } = inject();

  module.exports = {
  
    // setting locators
    fields: {
      email: '#user_basic_email',
      password: '#user_basic_password'
    },
    submitButton: {css: '#new_user_basic input[type=submit]'},
  
    // introducing methods
    login(email, password) {
      I.waitForElement("//input[@placeholder='email or username']", 30);
      I.fillField('email or username', email);
      I.fillField('password', password);
      I.click('Login button');
      I.waitForElement("//button[@aria-label='Skip change password button']", 30);
      I.click('Skip change password button');
      },
  
    register(email, password) {
      // use another page object inside current one
      registerPage.registerUser({ email, password });
    }
  }