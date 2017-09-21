module.exports = {
  '@tags': ['userprofile', 'smoke'],
  beforeEach: (client) => {
    client.loginPage = client.page.login()
    client.myProfile = client.page.myaccount()
    client.resizeWindow(1200, 900)
    client.page.login().navigate()
      .waitApp()
      .loginUserSuccess()
  },
  after: client => {
    client.end()
  },
  'success change user data': client => {
    client.assert.urlEquals(`${LINK_TO_RESOURCE}myaccount/websites`)
    client.myProfile.navigate()
      .waitApp()
      .changeUserFirstName('test name')
      .successSubmitUserData()
      .changeUserLasttName('test name')
      .successSubmitUserData()
      .changeUserStreetAddress1('test adr 1')
      .successSubmitUserData()
      .changeUserStreetAddress2('test adr 2')
      .successSubmitUserData()
      .changeCountry('test countr')
      .successSubmitUserData()
    client.execute('localStorage.clear()')
  },
  'success change user password': client => {
    client.assert.urlEquals(`${LINK_TO_RESOURCE}myaccount/websites`)
    client.myProfile.navigate()
      .waitApp()
      .changeUserPasswordSuccess(USER_PASSWORD, USER_PASSWORD)
    client.execute('localStorage.clear()')
  },
  'failed change user password': client => {
    client.assert.urlEquals(`${LINK_TO_RESOURCE}myaccount/websites`)
    client.myProfile.navigate()
      .waitApp()
      .changeUserPasswordFailed(USER_PASSWORD + '1', USER_PASSWORD)
    client.execute('localStorage.clear()')
  }
}