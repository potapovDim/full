const {landingMainPage, landingFooterPart} = require('./SELECTORS')

const landingMainPageAPI = {
  //remove all css animation
  disableTransition() {
    return this.disableCSS()
  },
  //wait when body load
  waitApp() {
    return this.waitForElementVisible('@app')
  },
  //login user
  goTologinModal() {
    return this.click('@userLogin')
  }
}
module.exports = {
  url: LINK_TO_RESOURCE,
  elements: {
    ...landingMainPage,
    ...landingFooterPart,
    app: '#app'
  },
  commands: [landingMainPageAPI]
}