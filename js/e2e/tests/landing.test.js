module.exports = {
  '@tags': ['smoke'],
  'execute disable transition': client => {
    const landing = client.page.landing()
    client.resizeWindow(600, 800)
    landing.navigate()
           .waitApp()
           .disableTransition()

    client.end()
  }
}