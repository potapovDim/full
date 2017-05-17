module.exports = {
  waitForConditionTimeout: 10000,
  before: function (done) {
    const userData = require(`../localdata/${process.env.NODE_ENV}.json`)
    global.LINK_TO_RESOURCE = userData.url
    global.USER_NAME = userData.username
    global.USER_PASSWORD = userData.password
    done()
  }
}