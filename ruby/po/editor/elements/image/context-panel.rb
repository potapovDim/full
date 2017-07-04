module ImageContextPanel
  #css selectors 
  #image element
  @image_element = '[data-test="draggable-element-image"]'
  #context panel item selector
  @context_panel_item = '[data-test="context-panel-item"]'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
  end
  #methods
  def self.focused_element
    @browser.element(css: @image_element).fire_event "mousedown"
    return self
  end
  def self.click_context_item(item="align center") #item in context panel text element
    items = @browser.elements(css: @context_panel_item)
    case item
      when "change image"
        items[0].click
      when "adjust image"
        items[1].click
      when "image settings"
        items[2].click
      when "duplicate"
        items[3].click
      when "align left"
        items[4].click
      when "align center"
        items[5].click
      when "align right"
        items[6].click
      when "remove"
        items[7].click
    end
    return self
  end
end
