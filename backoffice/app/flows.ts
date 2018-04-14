import { User } from './interfaces';
import { TopNav } from './models/fragments/topnav';
import { LeftNav } from './models/fragments/leftnav';
import { Login } from './models/login';

const loginPage = new Login()
const topNav = new TopNav()
const leftnav = new LeftNav()

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
  }
}