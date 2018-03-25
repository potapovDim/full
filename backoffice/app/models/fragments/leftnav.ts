import { Element, Elements } from 'awb'
import { element as $, elements as $$ } from '../../driver'

export class LeftNav {
  // root left nav component
  private root = $('.al-sidebar-list')

  private dashboard: Element
  private users: Element
  private websites: Element
  private domains: Element
  private domainsSettings: Element
  private domainsOpenSrs: Element
  private concepts: Element
  private conceptsCategories: Element
  private billingSubscriptions: Element
  private billingPayments: Element
  private billingPlans: Element
  private billingDiscounts: Element
  private billingSettings: Element
  private siterenders: Element
  private actions: Element
  private log: Element
  private statistics: Element
  private stock: Element
  private email: Element
  private settings: Element

  constructor() {
    this.dashboard = this.root.element('a[href="#dashboard"]')
    this.users = this.root.element('a[href="#/users"]')
    this.websites = this.root.element('a[href="#/websites"]')
    this.domains = this.root.element('a[href="#/domains"]')
    this.domainsSettings = this.root.element('a[href="#/domains/settings"]')
    this.domainsOpenSrs = this.root.element('a[href="#/domains/opensrs"]')
    this.concepts = this.root.element('a[href="#/concepts"]')
    this.conceptsCategories = this.root.element('a[href="#/concepts/categories"]')
    this.billingSubscriptions = this.root.element('a[href="#/billing/subscriptions"]')
    this.billingPayments = this.root.element('a[href="#/billing/payments"]')
    this.billingPlans = this.root.element('a[href="#/billing/plans"]')
    this.billingDiscounts = this.root.element('a[href="#/billing/discounts"]')
    this.billingSettings = this.root.element('a[href="#/billing/settings"]')
    this.siterenders = this.root.element('a[href="#/siterenders"]')
    this.actions = this.root.element('a[href="#/actions"]')
    this.log = this.root.element('a[href="#/log"]')
    this.statistics = this.root.element('a[href="#/statistics"]')
    this.stock = this.root.element('a[href="#/stock"]')
    this.email = this.root.element('a[href="#/email"]')
    this.settings = this.root.element('a[href="#/settings"]')
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