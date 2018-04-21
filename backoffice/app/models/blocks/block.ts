import { Element, Elements } from 'awb'
import { $, $$, client } from '../../driver'

export class Block {

  private preview: Preview
  private categories: Categories
  private dangerZone: DangerZone
  private info: Info
  private childBlocks: ChildBlocks
  private tags: Tags

  constructor() {
    this.preview = new Preview()
    this.categories = new Categories()
    this.dangerZone = new DangerZone()
    this.info = new Info()
    this.childBlocks = new ChildBlocks()
    this.tags = new Tags()
  }
}


class Info {

  private root: Element

  constructor() {
    this.root = $$('.card').get(3)
  }
}

class Preview {

  private root: Element

  constructor() {
    this.root = $$('.card').get(0)
  }
}

class Categories {

  private root: Element

  constructor() {
    this.root = $$('.card').get(1)
  }
}

class ChildBlocks {

  private root: Element

  constructor() {
    this.root = $$('.card').get(5)
  }
}

class DangerZone {

  private root: Element
  private deleteBlock: Element

  constructor() {
    this.root = $$('.card').get(2)
    this.deleteBlock = this.root.$('button.mat-raised-button.mat-warn')
  }
}

class Tags {

  private root: Element

  constructor() {
    this.root = $$('.card').get(4)
  }
}