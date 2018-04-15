import { User } from './interfaces'
import { TopNav } from './models/fragments/topnav'
import { LeftNav } from './models/fragments/leftnav'
import { Login } from './models/login'
import { WebsitesFilter } from './models'

const loginPage = new Login()
const topNav = new TopNav()
const leftnav = new LeftNav()
const websiteFilter = new WebsitesFilter()

export const flows = {
  'login': (data: User) => {
    it(`login ${data.username} ${data.role}`, async () => {
      await loginPage.login(data)
    })
  },
  'logout': (data) => {
    it(`logout ${data.username} ${data.role}`, async () => {
      await topNav.logOut()
    })
  },
  'dashboard': (data) => {
    it(`dashboard ${data.username} ${data.role}`, async () => {
      await leftnav.to.websites()
    })
  },
  'websites': (data) => {
    it(`websites ${data.username} ${data.role}`, async () => {
      const data = {
        boxes: [{ name: 'Premium', state: true }]
      }
      await websiteFilter.sendKeys(data)
    })
  }
}