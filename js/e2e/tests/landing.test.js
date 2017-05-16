module.exports = {
   'execute disable transition': (client) => {
     const initialPage = client.page.landing()
     initialPage.navigate()
     client.resizeWindow(600, 800)
     initialPage.waitApp()
     initialPage.disableTransition()
     client.end()
   }
 }