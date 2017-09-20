module.exports = {
  '@tags': ['login', 'smoke'],
  beforeEach: client => {
    client.loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    client.loginPage.navigate()
  },
  'success login user': client => {
    client.loginPage
      .waitApp()
      .loginUserSuccess()
    client.assert.urlEquals(`${LINK_TO_RESOURCE}myaccount/websites`)
    client.end()
  },
  'failed login user (empty email, empty password)': client => {
    client.loginPage
      .waitApp()
      .loginUserFailed('', USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin name bafore )': client => {
    client.loginPage
      .waitApp()
      .loginUserFailed(' ' + USER_NAME, USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin name after )': client => {
    client.loginPage
      .waitApp()
      .loginUserFailed(USER_NAME + ' ', USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin password before)': client => {
    client.loginPage
      .waitApp()
      .loginUserFailed(USER_NAME, ' ' + USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin password after)': client => {
    client.loginPage
      .waitApp()
      .loginUserFailed(USER_NAME, USER_PASSWORD + ' ')
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (regex password)': client => {
    client.loginPage
      .waitApp()
      .loginUserFailed(USER_NAME,
      /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (regex email)': client => {
    client.loginPage.navigate()
      .waitApp()
      .loginUserFailed(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
      USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  }
}