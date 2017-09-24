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
        return this.waitForElementVisible('@planAnnually')
            .click('@planAnnually')
      }
      case 'monthly': {
        return this.waitForElementVisible('@planMonthly')
            .click('@planMonthly')
      }
      case 'binnually': {
        return this.waitForElementVisible('@planBiannually')
            .click('@planBiannually')
      }
      default: {
        console.warn('invalid plan')
        break
      }
    }
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