#row layout
class LayoutTab
  def initialize(browser)
    @browser = browser
    @block_component           = '[data-test="block-component"]'
    @layout_item               = '[data-test="row-layout-item"]'
    @custom_layout_circle      = '.rc-slider'
    @no_margin                 = '#nomargin-option'
    #browser instance
    @browser
  end
  
  #api methods
  def change_layout(layout = 1)
    layouts = @browser.elements(css: @layout_item)[i+1].click
    return self
  end
  def create_cutom_layout(x, y, pointer_index=0)
    @browser.elements(css: @custom_layout_circle)[pointer_index].drag_and_drop_by x, y
    return self
  end
  def change_nomargin_option
    @browser.element(css: @no_margin).fire_event "change"
    return self
  end
end