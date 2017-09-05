require_relative "../../context-panel/context-panel"

class Map
  #css selectors
  @@draggable_map = '[data-test="draggable-element-map"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser   
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_map).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_map)
  end
end