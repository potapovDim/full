import { Element, Elements } from 'awb'
import { $, $$ } from '../driver'

class AccessLog {
  private country: Element
  private timeFrom: Element
  private timeTo: Element
  private ip: Element
  private clear: Element

  constructor() {
    this.country = $('[ng-reflect-id="country"]')
    this.timeFrom = $('[ng-reflect-id="clientIp"]')
    this.timeTo = $('[ng-reflect-id="country"]')
    this.ip = $('[ng-reflect-id="country"]')
    this.clear = $('[ng-reflect-id="country"]')
  }

}

export { }