#row layout
class LayoutTab
  def initialize(browser)
    @browser = browser
    @block_component           = '[data-test="block-component"]'
    @layout_item               = '[data-test="row-layout-item"]'
    @custom_layout_circle      = '[role="slider"]'
    @no_margin                 = 'No Indent between columns'
    @custom_width_text         = 'Change column width'
    #browser instance
  end
  
  #api methods
  def change_layout(i = 1)
    @browser.elements(css: @layout_item)[i-1].click
    return self
  end
  def create_custom_layout(x, y, pointer_index = 0)
    el =  @browser.driver.find_elements(css: @custom_layout_circle)[pointer_index]
    @browser.driver.action.drag_and_drop_by(el, x, y).perform
    return self
  end
  def change_nomargin_option
    @browser.element(css: @no_margin).fire_event "change"
    return self
  end
  def layout_active?(i)
    class_name = @browser.elements(css: @layout_item)[i-1].class_name
    return class_name.include?("active_")
  end
  def custom_width_presented?
    @browser.element(text: @custom_width_text).visible?
  end
  def get_layout_postion(i)
      return @browser.elements(css: @custom_layout_circle)[i].attribute_value("aria-valuenow")
  end
  def nomargin_click
    @browser.element(text: @no_margin).click
  end
end