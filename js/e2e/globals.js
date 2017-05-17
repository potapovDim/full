module.exports = {
  waitForConditionTimeout: 150000,
  before: function (done) {
    const pathToData = process.env.NODE_ENV || 'prod'
    const userData = require(`../localdata/${pathToData}.json`)
    global.LINK_TO_RESOURCE = userData.url
    global.USER_NAME = userData.username
    global.USER_PASSWORD = userData.password
    done()
  }
}