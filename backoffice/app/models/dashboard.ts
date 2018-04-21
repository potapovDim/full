import { Element, Elements } from 'awb'
import { $, $$ } from '../driver'

export class Dashboard {

  private cards: Elements
  private totalCustomers: Element
  private premiumWebsites: Element
  private totalWebsites: Element
  private publishedWebsites: Element
  private totalConcepts: Element
  private publishedConcepts: Element
  private totalProfit: Element
  private map: Element

  constructor() {
    // description-stats
    this.cards = $$('ba-card')
    this.totalCustomers = this.cards.get(0)
    this.premiumWebsites = this.cards.get(1)
    this.totalWebsites = this.cards.get(2)
    this.publishedWebsites = this.cards.get(3)
    this.totalConcepts = this.cards.get(4)
    this.publishedConcepts = this.cards.get(5)
    this.totalProfit = this.cards.get(6)
    this.map = this.cards.get(7)
  }

  public getStat() {
    return {
      totalCustomers: async () => await this.totalConcepts.element('.description-stats').getText(),
      premiumWebsites: async () => await this.premiumWebsites.element('.description-stats').getText(),
      totalWebsites: async () => await this.totalWebsites.element('.description-stats').getText(),
      publishedWebsites: async () => await this.publishedWebsites.element('.description-stats').getText(),
      totalConcepts: async () => await this.totalConcepts.element('.description-stats').getText(),
      publishedConcepts: async () => await this.publishedConcepts.element('.description-stats').getText(),
      totalProfit: async () => await this.totalProfit.element('.description-stats').getText(),
    }
  }
}