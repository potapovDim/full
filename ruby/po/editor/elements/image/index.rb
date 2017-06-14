require_relative "./context-panel"

class Image
  include ImageContextPanel
  #css selectors
  @@draggable_image = '[data-test="draggable-element-image"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ImageContextPanel.initBrowser @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_image).wait_until_present 
    @@browser.element(css: @@draggable_image).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ImageContextPanel.click_context_item align
  end
end