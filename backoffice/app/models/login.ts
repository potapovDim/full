import { $, browser, ElementFinder } from 'protractor'

export class Login {

  private username: ElementFinder
  private password: ElementFinder
  private signin: ElementFinder

  constructor() {
    this.username = $('#mat-input-0')
    this.password = $('#mat-input-1')
    this.signin = $('[type="submit"] > span')
  }

  public async login(user: { username: string, password: string }) {
    await this.username.sendKeys(user.username)
    await this.password.sendKeys(user.password)
    await this.signin.click()
  }
}
