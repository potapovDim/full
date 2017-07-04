require_relative "./context-panel"

class Map
  include MapContextPanel
  #css selectors
  @@draggable_map = '[data-test="draggable-element-map"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    MapContextPanel.initDriver @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_map).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    MapContextPanel.click_context_item align
  end
end