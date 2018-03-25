const { landingMainPage, loginModal, account } = require('./SELECTORS')

const loginPageAPI = {
  //remove all css animation
  disableTransition() {
    return this.disableCSS()
  },
  //wait when body load
  waitApp() {
    return this.waitForElementVisible('@app')
  },
  //login user
  loginUserSuccess(email, password) {
    //first email , second password
    if (arguments.length == 2) {
      return this.waitForElementVisible('@emailInput')
        .setValue('@emailInput', email)
        .setValue('@passwordInput', password)
        .click('@loginSubmitButton')
        .waitForElementPresent('@myProfile')
        .assert.urlContains('/myaccount')
    }
    else {
      return this.waitForElementVisible('@emailInput')
        .setValue('@emailInput', USER_NAME)
        .setValue('@passwordInput', USER_PASSWORD)
        .click('@loginSubmitButton')
        .waitForElementPresent('@myProfile')
        .assert.urlContains('/myaccount')
    }
  },
  loginUserFailed(email, password, alarmMessageLength) {
    if (email) {
      return this.waitForElementVisible('@emailInput')
        .setValue('@emailInput', email)
        .setValue('@passwordInput', password)
        .click('@loginSubmitButton')
        .pauseTime(500)
    }
    else {
      return this.waitForElementVisible('@emailInput')
        .setValue('@emailInput', 'abbabagalamaga@abbabagalamaga.abbabagalamaga')
        .setValue('@passwordInput', '01010101010110')
        .click('@loginSubmitButton')
        .pauseTime(500)
    }
  },
  googleLogin() {
    return this.waitForElementPresent('@emailInput')
      .click('@googleLoginButton')
      .waitForElementVisible('@googlePhoneOrEmailInput')
      .setValue('@googlePhoneOrEmailInput', USER_GOOGLE_EMAIL)
      .click('@nextAtEmail')
      .waitForElementPresent('@googlePasswordInput')
      .click('body')
      .setValue('@googlePasswordInput', USER_GOOGLE_PASSWORD)
      .click('@passNext')
      .waitForElementPresent('@myProfile')
  }
}
module.exports = {
  url: `${LINK_TO_RESOURCE}login`,
  elements: {
    ...landingMainPage,
    ...loginModal,
    ...account,
    app: '#app'
  },
  commands: [loginPageAPI]
}