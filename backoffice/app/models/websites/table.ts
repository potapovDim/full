import { Element, Elements } from 'awb'
import { $, $$ } from '../../driver'

class Table {
  private root: Element
  private statuses: Elements

  constructor() {
    this.root = $('.table-responsive.ng-star-inserted')
    this.statuses = this.root.$$('td:nth-child(7n)')
  }

  public async assertThatStatusPublished() {
    const statuses = await this.statuses.map(async (el) => await el.getText())
    return statuses.some(el => el !== 'Published')
  }
}

export { Table }
