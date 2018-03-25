class Line
  #css selectors
  @@draggable_line = '[data-test="draggable-element-line"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_line).wait_until_present
    @@browser.element(css: @@draggable_line).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_line)
  end
end