import { Element, Elements } from 'awb'
import { $, $$, client } from '../../driver'

export class Breadcrumbs {

  private list: Element

  constructor() {
    this.list = $('.breadcrumb.al-breadcrumb')
  }

  public async getActiveCrumb() {
    return client.executeScript(function(parent) {
      const lis = parent.querySectorAll('li')
      for (let i = 0; i < lis.length; i++) {
        if (!lis[i].querySector('a')) {
          return lis[i].innerText
        }
      }
    }, this.list)
  }

  public async goTo() {

  }
}