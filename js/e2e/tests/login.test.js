module.exports = {
  '@tags': ['login','smoke'],
  'success login user': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserSuccess()
    client.assert.urlEquals(`${LINK_TO_RESOURCE}myaccount/account/websites`)
    client.end()
  },
  'failed login user': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed()
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin name bafore )': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed(' '+USER_NAME, USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin name after )': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed(USER_NAME+ ' ', USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin password before)': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed(USER_NAME,' ' + USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (edge conditin password after)': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed(USER_NAME, USER_PASSWORD + ' ')
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (regex password)': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed(USER_NAME, 	
                /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  },
  'failed login user (regex email)': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
                                USER_PASSWORD)
    client.assert.urlEquals(`${LINK_TO_RESOURCE}login`)
    client.end()
  }
}