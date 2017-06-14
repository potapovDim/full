require_relative "./context-panel"

class Button
  include ButtonContextPanel
  #css selectors
  @@draggable_button = '[data-test="draggable-element-button"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ButtonContextPanel.initBrowser @@browser
  end
  #methods
  def focus_element
    @@browser.element(css: @@draggable_button).wait_until_present 
    @@browser.element(css: @@draggable_button).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ButtonContextPanel.click_context_item align
  end
end