const {plans} = require('./SELECTORS')

const plansPageAPI = {
  //remove all css animation
  disableTransition() {
    return this.disableCSS()
  },
  //wait when body load
  waitApp() {
    return this.waitForElementVisible('@app')
  },
  //change plan
  changeSelectedPlan(plan) {
    switch (plan) {
      case 'annually': {
        this.waitForElementVisible('@planAnnually')
            .click('@planAnnually')
        break
      }
      case 'monthly': {
        this.waitForElementVisible('@planMonthly')
            .click('@planMonthly')
        break
      }
      case 'binnually': {
        this.waitForElementVisible('@planBiannually')
            .click('@planBiannually')
        break
      }
      default: {
        console.warn('invalid plan')
        break
      }
    }
    return this
  },
  //assert price when choosed plan
  getDayPrice (expectedPrice) {
    return this.getText('@dayPrice', ({value}) => {
      this.assert.equal(value, expectedPrice)
    })
  }

}
module.exports = {
  url: `${LINK_TO_RESOURCE}plans`,
  elements: {
    ...plans,
    app: '#app'
  },
  commands: [plansPageAPI]
}