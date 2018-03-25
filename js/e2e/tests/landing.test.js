module.exports = {
  '@tags': ['smoke'],
  'execute disable transition': client => {
    const landing = client.page.landing()
    client.resizeWindow(1200, 900)
    landing.navigate()
           .waitApp()
    landing.moveToElement('@pricingLink', 0, 0)
           .click('@pricingLink')
    client.assert.urlContains('pricing')
    landing.navigate()
           .waitApp()
    landing.moveToElement('@conceptsLink', 0, 0)
           .click('@conceptsLink')
    client.assert.urlContains('concepts')
    landing.navigate()
           .waitApp()
    landing.moveToElement('@abouLink', 0, 0)
           .click('@abouLink')
    client.assert.urlContains('about')
    landing.navigate()
           .waitApp()
    landing.moveToElement('@termsOfUse', 0, 0)
           .click('@termsOfUse')
    client.assert.urlContains('terms')
    client.end()
  }
}