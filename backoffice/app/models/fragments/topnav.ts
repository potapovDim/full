import { $, $$, browser, ElementFinder } from 'protractor'

export class TopNav {

  private logo: ElementFinder
  private colorSheme: ElementFinder
  private colorGreen: ElementFinder
  private colorBlue: ElementFinder
  private avatar: ElementFinder
  private profile: ElementFinder
  private signOut: ElementFinder

  constructor() {
    this.logo = $('.al-logo.clearfix')
    this.colorSheme = $('.mat-button-wrapper')
    this.colorGreen = $('.theme-dot.teal-theme')
    this.colorBlue = $('.theme-dot.indigo-theme')
    this.avatar = $('.toolbar-avatar')
    this.profile = $$('.mat-menu-item').get(0)
    this.signOut = $('.mat-menu-item').get(1)
  }

}
