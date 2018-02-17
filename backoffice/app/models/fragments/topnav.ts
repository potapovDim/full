import { $, $$, browser, ElementFinder } from 'protractor'
import { waitForElement } from '../../helper'
export class TopNav {

  private logo: ElementFinder
  private collapseLeftNav: ElementFinder
  private colorSheme: ElementFinder
  private colorGreen: ElementFinder
  private colorBlue: ElementFinder
  private avatar: ElementFinder
  private profile: ElementFinder
  private signOut: ElementFinder

  constructor() {
    this.logo = $('.al-logo.clearfix')
    this.collapseLeftNav = $('.toolbar-menu.mat-icon.material-icons')
    this.colorSheme = $('.mat-button-wrapper')
    this.colorGreen = $('.theme-dot.teal-theme')
    this.colorBlue = $('.theme-dot.indigo-theme')
    this.avatar = $('.toolbar-avatar')
    this.profile = $$('.mat-menu-item').get(0)
    this.signOut = $$('.mat-menu-item').get(1)
  }

  public async logOut() {
    await waitForElement(this.avatar)
    await this.avatar.click()
    await waitForElement(this.signOut)
    await this.signOut.click()
  }
}
