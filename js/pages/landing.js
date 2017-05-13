const initialPage = {
  disableTransition() {
    return this.disableCSS()
  },
  waitApp() {
    return this.waitForElementVisible('@app')
  }
}
module.exports = {
  url: 'https://weblium.com',
  elements: {
    app: '#app'
  },
  commands: [initialPage]
}