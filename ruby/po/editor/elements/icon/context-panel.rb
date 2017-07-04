module IconContextPanel
  #css selectors 
  #line element
  @icon_element = '[data-test="draggable-element-icon"]'
  #context panel item selector
  @context_panel_item = '[data-test="context-panel-item"]'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
  end
  #methods
  def self.focused_element
    @browser.element(css: @icon_element).fire_event "mousedown"
    return self
  end
  def self.click_context_item(item="align center") #item in context panel text element
    items = @browser.elements(css: @context_panel_item)
    case item
      when "change icon"
        items[0].click
      when "icon style"
        items[1].click
      when "duplicate"
        items[2].click
      when "align left"
        items[3].click
      when "align center"
        items[4].click
      when "align right"
        items[5].click
      when "remove"
        items[6].click
    end
    return self
  end
end
