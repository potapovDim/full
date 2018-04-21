import { Element, Elements } from 'awb'
import { $, $$, client } from '../../driver'

export class BlockList {

  private root: Element
  private searchName: Element
  private published: Element
  private clearSearchField: Element

  constructor() {
    this.root = $('blocks')
    this.searchName = this.root.$('input#name')
    this.published = this.root.$('.mat-checkbox-inner-container')
    this.clearSearchField = this.root.$('.btn-mm.btn-m.pull-right.mat-button.mat-primary')
  }
}
