import { $, $$, browser, ElementFinder, ElementArrayFinder } from 'protractor'

export class Dashboard {

  private cards: ElementArrayFinder
  private totalCustomers: ElementFinder
  private premiumWebsites: ElementFinder
  private totalWebsites: ElementFinder
  private publishedWebsites: ElementFinder
  private totalConcepts: ElementFinder
  private publishedConcepts: ElementFinder
  private totalProfit: ElementFinder
  private map: ElementFinder

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
      totalCustomers: async () => await this.totalConcepts.$('.description-stats').getText(),
      premiumWebsites: async () => await this.premiumWebsites.$('.description-stats').getText(),
      totalWebsites: async () => await this.totalWebsites.$('.description-stats').getText(),
      publishedWebsites: async () => await this.publishedWebsites.$('.description-stats').getText(),
      totalConcepts: async () => await this.totalConcepts.$('.description-stats').getText(),
      publishedConcepts: async () => await this.publishedConcepts.$('.description-stats').getText(),
      totalProfit: async () => await this.totalProfit.$('.description-stats').getText(),
    }
  }

}