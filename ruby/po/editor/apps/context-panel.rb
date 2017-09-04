module ContextPanel
  #css selectors 
  #  #context panel item selector
  @context_panel_item = '[data-test="context-panel-item"]'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
  end
  def self.init_element_selector (element_selector)
    @element_selector = element_selector
  end
  #methods
  def self.focused_element
    @browser.element(css: @element_selector).fire_event "mousedown"
    return self
  end
  def self.click_context_item(item="align center") #item in context panel text element
    items = @browser.elements(css: @context_panel_item)
    
    if item.include? "align"
      case item
        when "align left"
          items[items.length - 4].click
        when "align center"
          items[items.length - 3].click
        when "align right"
          items[items.length - 2].click
      end
    else
      @browser.element(:text =>item).when_present.click 
    end
    return self
  end
end
