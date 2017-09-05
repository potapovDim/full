class Breadcrumbs
  #css selectors
  @@draggable_contact_form = '[data-test="draggable-element-breadcrumbs"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_contact_form).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_contact_form)
  end
end