const initialPage = {
  disableTransition() {
    return this.disableCSS(1)
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