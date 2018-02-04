import { $, $$, browser, ElementFinder } from 'protractor'

export class LeftNav {
  // root left nav component
  private root = $('.al-sidebar-list')

  private dashboard: ElementFinder
  private users: ElementFinder
  private websites: ElementFinder
  private domains: ElementFinder
  private domainsSettings: ElementFinder
  private domainsOpenSrs: ElementFinder
  private concepts: ElementFinder
  private conceptsCategories: ElementFinder
  private billingSubscriptions: ElementFinder
  private billingPayments: ElementFinder
  private billingPlans: ElementFinder
  private billingDiscounts: ElementFinder
  private billingSettings: ElementFinder
  private siterenders: ElementFinder
  private actions: ElementFinder
  private log: ElementFinder
  private statistics: ElementFinder
  private stock: ElementFinder
  private email: ElementFinder
  private settings: ElementFinder

  constructor() {
    this.dashboard = this.root.$('a[href="#dashboard"]')
    this.users = this.root.$('a[href="#/users"]')
    this.websites = this.root.$('a[href="#/websites"]')
    this.domains = this.root.$('a[href="#/domains"]')
    this.domainsSettings = this.root.$('a[href="#/domains/settings"]')
    this.domainsOpenSrs = this.root.$('a[href="#/domains/opensrs"]')
    this.concepts = this.root.$('a[href="#/concepts"]')
    this.conceptsCategories = this.root.$('a[href="#/concepts/categories"]')
    this.billingSubscriptions = this.root.$('a[href="#/billing/subscriptions"]')
    this.billingPayments = this.root.$('a[href="#/billing/payments"]')
    this.billingPlans = this.root.$('a[href="#/billing/plans"]')
    this.billingDiscounts = this.root.$('a[href="#/billing/discounts"]')
    this.billingSettings = this.root.$('a[href="#/billing/settings"]')
    this.siterenders = this.root.$('a[href="#/siterenders"]')
    this.actions = this.root.$('a[href="#/actions"]')
    this.log = this.root.$('a[href="#/log"]')
    this.statistics = this.root.$('a[href="#/statistics"]')
    this.stock = this.root.$('a[href="#/stock"]')
    this.email = this.root.$('a[href="#/email"]')
    this.settings = this.root.$('a[href="#/settings"]')
  }
}

  // #/dashboard
  // #/users
  // #/websites
  // #/domains
  // #/domains/settings
  // #/domains/opensrs
  // #/concepts
  // #/concepts/categories
  // #/billing/subscriptions
  // #/billing/payments
  // #/billing/plans
  // #/billing/discounts
  // #/billing/settings
  // #/siterenders
  // #/actions
  // #/log
  // #/statistics
  // #/stock
  // #/email
  // #/settings