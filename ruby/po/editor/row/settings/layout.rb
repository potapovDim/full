#row layout
module LayoutTab
  @block_component           = '[data-test="block-component"]'
  @layout_item               = '[data-test="row-layout-item"]'
  @custom_layout_circle      = '.rc-slider'
  @no_margin                 = '#nomargin-option'
  #browser instance
  @browser
  def self.initBrowser(browser)
    @browser = browser
    return self
  end
  #api methods
  def self.change_layout(layout = 1)
    layouts = @browser.elements(css: @layout_item)
    case layout
      when 1
        layouts[0].click
      when 2
        layouts[1].click
      when 3
        layouts[2].click
      when 4
        layouts[3].click
      when 5
        layouts[4].click
      when 6
        layouts[5].click
      when 7
        layouts[6].click
      when 8
        layouts[7].click
      when 9
        layouts[8].click
      when 10
        layouts[9].click
      when 11
        layouts[10].click
      when 12
        layouts[11].click
      when 13
        layouts[12].click
    end
    return self
  end
  def self.create_cutom_layout(x, y, pointer_index=0)
    @browser.elements(css: @custom_layout_circle)[pointer_index].drag_and_drop_by x, y
    return self
  end
  def self.change_nomargin_option
    @browser.element(css: @no_margin).fire_event "change"
    return self
  end
end