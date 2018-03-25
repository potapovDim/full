import { Element, Elements } from 'awb'
import { element as $, elements as $$ } from '../driver'

export class Login {

  private username: Element
  private password: Element
  private signin: Element

  constructor() {
    this.username = $('[name="username"]').waitForElementVisible(1000)
    this.password = $('[name="password"]').waitForElementVisible(1000)
    this.signin = $('[type="submit"] > span').waitForClicable(1000)
  }

  public async login(user: { username: string, password: string }) {
    await this.username.sendKeys(user.username)
    await this.password.sendKeys(user.password)
    await this.signin.click()
  }
}
