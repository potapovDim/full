const {editorTopNav} = require('./SELECTORS')

const editorAPI = {
  //remove all css animation
  disableTransition() {
    return this.disableCSS()
  },
  //wait when body load
  waitApp() {
    return this.waitForElementVisible('@app')
  }
}
module.exports = {
  url: LINK_TO_RESOURCE,
  elements: {
    ...editorTopNav,
    app: '#app'
  },
  commands: [editorAPI]
}