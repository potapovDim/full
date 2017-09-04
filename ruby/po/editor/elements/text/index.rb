require_relative "../context-panel"

class Text
  include ContextPanel
  #css selectors
  @@draggable_text = '[data-test="draggable-element-text"]' #draggable decorator selector
  #@extensions_text = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanel.initDriver @@browser
    ContextPanel.init_element_selector @@draggable_text
    
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_text).wait_until_present
    @@browser.element(css: @@draggable_text).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ContextPanel.click_context_item align
  end
end