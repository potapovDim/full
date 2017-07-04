require_relative "./context-panel"

class Text
  include TextContextPanel
  #css selectors
  @@draggable_text = '[data-test="draggable-element-text"]' #draggable decorator selector
  #@extensions_text = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    TextContextPanel.initDriver @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_text).wait_until_present
    @@browser.element(css: @@draggable_text).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    TextContextPanel.click_context_item align
  end
end