import { Element, Elements } from 'awb'
import { $, $$, client } from '../../driver'

export class BlockCategories {

  private root: Element

  constructor() {
    this.root = $('blocks-categories').waitForElementPresent(2500)
  }
}

class AddBlockCategory {

  private root: Element
  private categoryKey: Element
  private categoryName: Element
  private add: Element

  constructor() {
    this.root = $('.card').waitForElementVisible(5000)
    this.categoryKey = this.root.$('#catId')
    this.categoryName = this.root.$('#catName')
    this.add = this.root.$('button > .mat-button-focus-overlay')
  }

  public async addCategory(category: { key: string, name: string }) {
    await this.categoryKey.sendKeys(category.key)
    await this.categoryName.sendKeys(category.name)
    await this.add.click()
  }
}