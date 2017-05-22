const { account, myProfile } = require('./SELECTORS')

const myAccountAPI = {
  //remove all css animation
  disableTransition() {
    return this.disableCSS()
  },
  //wait when body load
  waitApp() {
    return this.waitForElementVisible('@app')
  },
  //change user data block
  changeUserFirstName(name) {
    return this.clearValue('@firstUserName')
               .setValue('@firstUserName', name)
  },
  changeUserLasttName(lastName) {
    return this.clearValue('@lastUserName')
               .setValue('@lastUserName', lastName)
  },
  changeUserPhoneNumber(userPhoneNumber) {
    return this.clearValue('@phoneUserName')
               .setValue('@phoneUserName', userPhoneNumber)
  },
  changeUserStreetAddress1(address1) {
    return this.clearValue('@streetUserAddress1')
               .setValue('@streetUserAddress1', address1)
  },
  changeUserStreetAddress2(address2) {
    return this.clearValue('@streetUserAddress2')
               .setValue('@streetUserAddress2', address2)
  },
  changeUserCityName(cityName) {
    return this.clearValue('@cityName')
               .setValue('@cityName', cityName)
  },
  changeUserStateName(stateName) {
    return this.clearValue('@regionStateName')
               .setValue('@regionStateName', stateName)
  },
  changePostalCode(postalCode){
    return this.clearValue('@zipCode')
               .setValue('@zipCode', postalCode)
  },
  changeCountry(count){
    return this.click('@countryOpenList')
                .clickOption(count)
  },
  //succes submit user data
  successSubmitUserData(){
    return this.waitForElementNotPresent('@saveButtonProgress', 1500)
               .waitForElementNotPresent('@saveButtonSuccess', 1500)
               .click('@saveButton')
               .waitForElementVisible('@saveButtonProgress')
               .waitForElementVisible('@saveButtonSuccess')
  },
  //change user password
  changeUserPasswordSuccess(oldPass, newPass) {
    return this.waitForElementNotPresent('@oldPasswordInput')
               .setValue('@oldPasswordInput', oldPass)
               .waitForElementNotPresent('@newPasswordInput')
               .setValue('@newPasswordInput', newPass)
               .waitForElementNotPresent('@newPasswordConfirmInput')
               .setValue('@newPasswordConfirmInput', newPass)
               .click('@changePasswordButton')
               .waitForElementNotPresent('@changePasswordButtonProgress')
               .waitForElementNotPresent('@changePasswordButtonSuccess')

  },
  //changePasswordButtonFail
  changeUserPasswordFailed(oldPass, newPass) {
    return this.waitForElementNotPresent('@oldPasswordInput')
               .setValue('@oldPasswordInput', oldPass)
               .waitForElementNotPresent('@newPasswordInput')
               .setValue('@newPasswordInput', newPass)
               .waitForElementNotPresent('@newPasswordConfirmInput')
               .setValue('@newPasswordConfirmInput', newPass)
               .click('@changePasswordButton')
               .waitForElementNotPresent('@changePasswordButtonProgress')
               .waitForElementNotPresent('@changePasswordButtonFail')
  }
}
module.exports = {
  url: `${LINK_TO_RESOURCE}myaccount/account/profile`,
  elements: {
    ...account,
    ...myProfile,
    app: '#app'
  },
  commands: [myAccountAPI]
}