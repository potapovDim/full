require_relative "./context-panel"

class Icon
  include IconContextPanel
  #css selectors
  @@draggable_icon = '[data-test="draggable-element-icon"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    IconContextPanel.initDriver @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_icon).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    IconContextPanel.click_context_item align
  end
end