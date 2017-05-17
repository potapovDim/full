module.exports = {
  '@tags': ['login','smoke'],
  'success login user': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserSuccess()
    client.end()
  },
  'failed login user': client => {
    const loginPage = client.page.login()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserFailed()
    client.end()
  }
}