require_relative "../context-panel"

class Icon
  include ContextPanel
  #css selectors
  @@draggable_icon = '[data-test="draggable-element-icon"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanel.initDriver @@browser
    ContextPanel.init_element_selector @@draggable_icon
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_icon).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ContextPanel.click_context_item align
  end
end