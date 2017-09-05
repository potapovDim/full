require_relative "../../context-panel/context-panel"

class Text
  #css selectors
  @@draggable_text = '[data-test="draggable-element-text"]' #draggable decorator selector
  #@extensions_text = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_text).wait_until_present
    @@browser.element(css: @@draggable_text).fire_event "mousedown"
  end
  def get_context_panel()
    return ContextPanel.new(@@browser,@@draggable_text)
  end
end