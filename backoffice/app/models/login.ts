import { waitForElement } from '../helper'
import { $, browser, ElementFinder } from 'protractor'

export class Login {

  private username: ElementFinder
  private password: ElementFinder
  private signin: ElementFinder

  constructor() {
    this.username = $('[name="username"]')
    this.password = $('[name="password"]')
    this.signin = $('[type="submit"] > span')
  }

  public async login(user: { username: string, password: string }) {
    await waitForElement([this.username, this.password])
    await this.username.sendKeys(user.username)
    await this.password.sendKeys(user.password)
    await this.signin.click()
  }
}
