import { Element, Elements } from 'awb'
import { $, $$, client } from '../../driver'

export class BlockCategories {

  private root: Element
  private searchName: Element
  private addNew: Element
  private clearSearchField: Element
  private addBlockCategory: AddBlockCategory
  private categoriesList: Elements

  constructor() {
    this.root = $('blocks-categories').waitForElementPresent(2500)
    this.searchName = this.root.$('input#name')
    this.addNew = this.root.$$('.mat-button-ripple.mat-ripple.mat-button-ripple-round').get(0)
    this.clearSearchField = this.root.$('.btn-mm.btn-m.pull-right.mat-button.mat-primary')
    this.addBlockCategory = new AddBlockCategory()
    this.categoriesList = this.root.$$('tr.ng-star-inserted')
  }

  public async openByName(categoryName: string) {
    const category = await this.categoriesList.filter(
      async (el) => await el.getText() === categoryName
    )
  }

  public async addNewCatecory(category: { name: string, key: string }) {
    await this.addNew.click()
    await this.addBlockCategory.add(category)
  }
}

class AddBlockCategory {

  private root: Element
  private categoryKey: Element
  private categoryName: Element
  private addButton: Element

  constructor() {
    this.root = $('.card').waitForElementVisible(5000)
    this.categoryKey = this.root.$('#catId')
    this.categoryName = this.root.$('#catName')
    this.addButton = this.root.$('button > .mat-button-focus-overlay')
  }

  public async add(category: { key: string, name: string }) {
    await this.categoryKey.sendKeys(category.key)
    await this.categoryName.sendKeys(category.name)
    await this.addButton.click()
  }
}