class ContextPanel
  #css selectors 
  #  #context panel item selector
  
  #browser instance
  def initialize(browser, element_selector)
    @@browser = browser
    @element_selector = element_selector
    @@context_panel_item = '[data-test="context-panel-item"]'
  end
  #methods
  def focused_element
    @browser.element(css: @element_selector).fire_event "mousedown"
    return self
  end

  def click_context_item (item) #item in context panel text element
    items =  @@browser.elements(css: @@context_panel_item)
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
      @@browser.element(:text =>item).when_present.click 
    end
    sleep 0.2
    return self
  end
end
