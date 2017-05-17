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
  }
}