import { Element, Elements } from 'awb'
import { $, $$, client } from '../../driver'

export class LeftNav {
  // root left nav component
  private root = $('#al-sidebar-list').waitForElementVisible(1000)

  private async clickMenu(menuItem) {
    await this.root.getElementHTML()
    const result = await client.executeScript(`
        const menuPoint = arguments[0]

        const emptyArr = []

        const menuItems = menuPoint.split('>')
        if (menuItems.length === 1) {
          const muneList = document.querySelector('#al-sidebar-list')
          const items = document.querySelectorAll('#al-sidebar-list > mat-list-item')
          for (let i = 0; i < items.length; i++) {
            // a.push(items[i].innerText)
            if (items[i].innerText.includes(menuItems[0])) {
              items[i].querySelector('a[href]').click()
              return 'Action was executed'
            }
          }
          return a
        } else if (menuItems.length === 2) {
          const arrows = document.querySelectorAll('[aria-hidden="true"].arrow.mat-icon.material-icons.ng-star-inserted[class$="ng-star-inserted"]')
          emptyArr.forEach.call(arrows, (arrow) => arrow.click())

          const itemsTop = document.querySelectorAll('#al-sidebar-list > mat-list-item')

          for (let i = 0; i < itemsTop.length; i++) {
            if (itemsTop[i].innerText.includes(menuItems[0])) {
              const items = itemsTop[i].querySelectorAll('mat-list > mat-list-item')
              for (let j = 0; j < items.length; j++) {
                if (items[j].innerText.includes(menuItems[1])) {
                  items[j].querySelector('a[href]').click()
                }
              }
            }
          }
        }
    `, menuItem)
  }

  public get to() {
    return {
      dashboard: async () => await this.clickMenu('Dashboard'),
      websites: async () => await this.clickMenu('Websites'),

    }
  }
}


function aa() {
  const emptyArr = []

  const muneList = document.querySelector('#al-sidebar-list')

}
// private async expandAll() {
//   await client.executeScript(`
//       const emptyArr = []
//       const arrows = document.querySelectorAll('[aria-hidden="true"].arrow.mat-icon.material-icons.ng-star-inserted[class$="ng-star-inserted"]')
//       emptyArr.forEch.call(arrows, (arrow) => arrow.click())
//   `, undefined)
// }


// function goTo(menuPoint) {
//   const emptyArr = []

//   const menuItems = menuPoint.split('>')


//   if (menuItems.length === 1) {
//     const muneList = document.querySelector('#al-sidebar-list')
//     const items = document.querySelectorAll('#al-sidebar-list > mat-list-item')
//     for (let i = 0; i < items.length; i++) {
//       if (items[i].innerText.includes(menuItems[0])) {
//         items[i].querySelector('a[href]').click()
//       }
//     }
//   } else if (menuItems.length === 2) {
//     const arrows = document.querySelectorAll('[aria-hidden="true"].arrow.mat-icon.material-icons.ng-star-inserted[class$="ng-star-inserted"]')
//     emptyArr.forEach.call(arrows, (arrow) => arrow.click())

//     const itemsTop = document.querySelectorAll('#al-sidebar-list > mat-list-item')

//     for (let i = 0; i < itemsTop.length; i++) {
//       if (itemsTop[i].innerText.includes(menuItems[0])) {
//         const items = itemsTop[i].querySelectorAll('mat-list > mat-list-item')
//         for (let j = 0; j < items.length; j++) {
//           if (items[j].innerText.includes(menuItems[1])) {
//             items[j].querySelector('a[href]').click()
//           }
//         }
//       }
//     }
//   }
// }


function AAA() {
  const menuPoint = arguments[0]

  const emptyArr = []

  const menuItems = menuPoint.split('>')

  if (menuItems.length === 1) {
    const muneList = document.querySelector('#al-sidebar-list')
    const items = document.querySelectorAll('#al-sidebar-list > mat-list-item')
    for (let i = 0; i < items.length; i++) {
      if (items[i].innerText.includes(menuItems[0])) {
        items[i].querySelector('a[href]').click()
      }
    }
  } else if (menuItems.length === 2) {
    const arrows = document.querySelectorAll('[aria-hidden="true"].arrow.mat-icon.material-icons.ng-star-inserted[class$="ng-star-inserted"]')
    emptyArr.forEach.call(arrows, (arrow) => arrow.click())

    const itemsTop = document.querySelectorAll('#al-sidebar-list > mat-list-item')

    for (let i = 0; i < itemsTop.length; i++) {
      if (itemsTop[i].innerText.includes(menuItems[0])) {
        const items = itemsTop[i].querySelectorAll('mat-list > mat-list-item')
        for (let j = 0; j < items.length; j++) {
          if (items[j].innerText.includes(menuItems[1])) {
            items[j].querySelector('a[href]').click()
          }
        }
      }
    }
  }
}

// function findSubMath() {
//   const emptyArr = []

//   const items = document.querySelectorAll('mat-list-item')
//   emptyArr.forEach.call(items, element => {
//     if (element.querySelectorAll('mat-list').length) {
//       const subMenuItems = element.querySelectorAll('mat-list')[0].querySelectorAll('mat-list-item')
//       emptyArr.forEach.call(subMenuItems, el => {
//         console.log('=========================')
//         console.log(el.innerText)
//         console.log('=========================')
//       })
//     }
//   })
// }

// #/dashboard
// #/users
// #/websites
// #/domains
// #/domains/settings
// #/domains/opensrs
// #/concepts
// #/concepts/categories
// #/billing/subscriptions
// #/billing/payments
// #/billing/plans
// #/billing/discounts
// #/billing/settings
// #/siterenders
// #/actions
// #/log
// #/statistics
// #/stock
// #/email
// #/settings

// this.dashboard = this.root.element('a[href="#dashboard"]')
// this.users = this.root.element('a[href="#/users"]')
// this.websites = this.root.element('a[href="#/websites"]')
// this.domains = this.root.element('a[href="#/domains"]')
// this.domainsSettings = this.root.element('a[href="#/domains/settings"]')
// this.domainsOpenSrs = this.root.element('a[href="#/domains/opensrs"]')
// this.concepts = this.root.element('a[href="#/concepts"]')
// this.conceptsCategories = this.root.element('a[href="#/concepts/categories"]')
// this.billingSubscriptions = this.root.element('a[href="#/billing/subscriptions"]')
// this.billingPayments = this.root.element('a[href="#/billing/payments"]')
// this.billingPlans = this.root.element('a[href="#/billing/plans"]')
// this.billingDiscounts = this.root.element('a[href="#/billing/discounts"]')
// this.billingSettings = this.root.element('a[href="#/billing/settings"]')
// this.siterenders = this.root.element('a[href="#/siterenders"]')
// this.actions = this.root.element('a[href="#/actions"]')
// this.log = this.root.element('a[href="#/log"]')
// this.statistics = this.root.element('a[href="#/statistics"]')
// this.stock = this.root.element('a[href="#/stock"]')
// this.email = this.root.element('a[href="#/email"]')
// this.settings = this.root.element('a[href="#/settings"]')