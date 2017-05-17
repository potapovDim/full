module.exports = {
  '@tags': ['smoke'],
  'execute disable transition': client => {
    const initialPage = client.page.landing()
    client.resizeWindow(600, 800)
    initialPage.navigate()
               .waitApp()
               .disableTransition()
    client.end()
  }
}