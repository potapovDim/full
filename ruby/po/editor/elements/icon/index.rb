require_relative "../../context-panel/context-panel"

class Icon
  #css selectors
  @@draggable_icon = '[data-test="draggable-element-icon"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_icon).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_icon)
  end
end