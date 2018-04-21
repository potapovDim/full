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

  }
}

class Preview {

  private root: Element

  constructor() {

  }
}

class Categories {

  private root: Element

  constructor() {

  }
}

class ChildBlocks {

  private root: Element

  constructor() {

  }
}

class DangerZone {
  private root: Element

  constructor() {

  }
}

class Tags {
  private root: Element

  constructor() {

  }
}