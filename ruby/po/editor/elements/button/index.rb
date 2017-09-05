require_relative "../../context-panel/context-panel"
class Button
  #css selectors
  @@draggable_button = '[data-test="draggable-element-button"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element
    @@browser.element(css: @@draggable_button).wait_until_present 
    @@browser.element(css: @@draggable_button).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_button)
  end
end