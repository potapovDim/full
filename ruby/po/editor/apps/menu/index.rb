require_relative "../../context-panel/context-panel"

class Menu
  #css selectors
  @@draggable_menu = '[data-test="draggable-element-menu"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_menu).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_menu)
  end
end