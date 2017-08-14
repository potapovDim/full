module BreadcrumbsContextPanel
  #css selectors 
  #contact-from element
  @contact_form_element = '[data-test="draggable-element-breadcrumbs"]'
  #context panel item selector
  @context_panel_item = '[data-test="context-panel-item"]'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
  end
  #methods
  def self.focused_element
    @browser.element(css: @contact_form_element).fire_event "mousedown"
    return self
  end
  def self.click_context_item(item="align center") #item in context panel text element
    items = @browser.elements(css: @context_panel_item)
    case item
      when "breadcrumbs settings"
        items[0].click
      when "duplicate"
        items[1].click
      when "remove"
        items[2].click
    end
    return self
  end
end
