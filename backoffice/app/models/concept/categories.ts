import { Element, Elements } from 'awb'
import { $, $$ } from '../../driver'

class ConceptCategories {

  private root: Element
  private search: Element

  constructor() {
    this.root = $('categories')
    this.search = this.root.$('input#filter')
  }
}

class AddNew {
  private categoryName: Element
  private categoryKey: Element
  private addNew: Element

  constructor(parameters) {
    this.addNew = this.root.$$('.mat-button-ripple.mat-ripple.mat-button-ripple-round').get(0)
  }
}
