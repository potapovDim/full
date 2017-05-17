module.exports = {
  '@tags': ['userprofile','smoke'],
  'success login user': client => {
    const loginPage = client.page.login()
    const myProfile = client.page.myaccount()
    client.resizeWindow(1200, 900)
    loginPage.navigate()
             .waitApp()
             .loginUserSuccess()
    client.assert.urlEquals(`${LINK_TO_RESOURCE}myaccount/account/websites`)
    myProfile.navigate()
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
    client.end()
  }
}