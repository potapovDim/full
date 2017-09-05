require_relative "../../context-panel/context-panel"

class Slider
  #css selectors
  @@draggable_slider = '[data-test="draggable-element-slider"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_slider).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_slider)
  end
end