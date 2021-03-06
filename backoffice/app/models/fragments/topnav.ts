import { Elements, Element } from 'awb'
import { $, $$ } from '../../driver'

export class TopNav {

  private logo: Element
  private collapseLeftNav: Element
  private colorSheme: Element
  private colorGreen: Element
  private colorBlue: Element
  private avatar: Element
  private profile: Element
  private signOut: Element
  private menuItems: Elements
  private loader: Element

  constructor() {
    this.loader = $('.spinner-wrapper')
    this.logo = $('.al-logo.clearfix')
    this.collapseLeftNav = $('.toolbar-menu.mat-icon.material-icons')
    this.colorSheme = $('.mat-button-wrapper')
    this.colorGreen = $('.theme-dot.teal-theme')
    this.colorBlue = $('.theme-dot.indigo-theme')
    this.avatar = $('.toolbar-avatar').waitForClickable(45000)
    this.menuItems = $$('.mat-menu-item').waitForElements(2500)
    // this.profile = this.menuItems.get(0)
    this.signOut = this.menuItems.get(1).waitForClickable(45000)
  }

  public async logOut() {
    await this.loader.waitUntilDisappear(45000)
    await this.avatar.click()
    await this.signOut.click()
  }
}
