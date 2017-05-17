const initialPage = {
  disableTransition() {
    return this.disableCSS(1)
  },
  waitApp() {
    return this.waitForElementVisible('@app')
  }
}
module.exports = {
  url: LINK_TO_RESOURCE,
  elements: {
    app: '#app'
  },
  commands: [initialPage]
}