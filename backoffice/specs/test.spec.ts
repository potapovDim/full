import { expect } from 'chai'
import { browser, by, element, ElementFinder, $ } from 'protractor'

class Login {
  private username: ElementFinder
  private password: ElementFinder
  private loginbtn: ElementFinder

  constructor() {
    this.username = $('#test')
    this.password = $('#test')
    this.loginbtn = $('#test')
  }

  async login(user: { usernam: string, password: string }) {
    await this.username.sendKeys(user.usernam)
    await this.password.sendKeys(user.password)
    await this.loginbtn.click()
  }
}


const loginPo = new Login()


describe('test ', function () {
  it('test async', async () => {
    await browser.get('https://angularjs.org');

    await element(by.model('todoList.todoText')).sendKeys('write first protractor test');
    await element(by.css('[value="add"]')).click();

    const todoList = element.all(by.repeater('todo in todoList.todos'));
    expect(await todoList.count()).to.eql(3);
    expect(await todoList.get(2).getText()).to.eql('write first protractor test');

    todoList.get(2).element(by.css('input')).click();
    const completedAmount = element.all(by.css('.done-true'));
    expect(await completedAmount.count()).to.eql(2);
  })
})
