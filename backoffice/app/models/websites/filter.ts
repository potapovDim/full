import { Element, Elements } from 'awb'
import { $, $$ } from '../../driver'

enum Boxes {
  Premium = 0,
  Published = 1,
  Template = 2,
  Deleted = 3,
  Public = 4
}

interface IWebsiteFilter {
  boxes?: Array<{ name: string, state: boolean }>
  humanIdOrId?: string
  createdFrom?: string
  createdTo?: string
  subdomain?: string
  name?: string
}


class Checkboses {

  private boxes: Elements
  private boxesEnum: any

  constructor(boxesEnum, root) {
    this.boxes = root.$$('mat-checkbox')
    this.boxesEnum = boxesEnum
  }

  public async sendKeys(boxes: Array<{ name: string, state: boolean }>) {
    for (const box of boxes) {
      await this.setBoxState(box)
    }
  }

  private async setBoxState({ name, state }) {
    const boxState = (await this.boxes.get(this.boxesEnum[name]).$('input[type="checkbox"]').getAttribute('aria-checked')) === 'true'
    if (!boxState === state) {
      await this.boxes.get(this.boxesEnum[name]).click()
    }
  }
}

class WebsitesFilter {
  private root = $('basic-table-filter').waitForElement(2500)
  private boxes: Checkboses
  private humanIdOrId: Element
  private createdFrom: Element
  private createdTo: Element
  private subdomain: Element
  private name: Element
  private loader: Element

  constructor() {
    this.boxes = new Checkboses(Boxes, this.root)
    this.humanIdOrId = this.root.$('[placeholder="ID or Human ID"]')
    this.createdFrom = this.root.$('[placeholder="Created from"]')
    this.createdTo = this.root.$('[placeholder="Created to"]')
    this.subdomain = this.root.$('[placeholder="Subdomain"]')
    this.name = this.root.$('[placeholder="Name"]')
  }

  public async sendKeys(filterObj: IWebsiteFilter) {
    await this.root.getAttribute('tag')
    const keys = Object.keys(filterObj)
    for (const key of keys) {
      await this[key].sendKeys(filterObj[key])
    }
  }
}

export { WebsitesFilter }
