module.exports = {
  waitForConditionTimeout: 10000,
  before: function (done) {
    const pathToData = process.env.NODE_ENV || 'prod'
    const userData = require(`../localdata/${pathToData}.json`)
    global.LINK_TO_RESOURCE = userData.url
    global.USER_NAME = userData.username
    global.USER_PASSWORD = userData.password
    global.USER_GOOGLE_EMAIL = userData.gmail
    global.USER_GOOGLE_PASSWORD = userData.gmail_password
    done()
  }
}