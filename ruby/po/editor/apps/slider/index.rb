require_relative "./context-panel"

class Slider
  include SliderContextPanel
  #css selectors
  @@draggable_social_icons = '[data-test="draggable-element-slider"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    SliderContextPanel.initDriver @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_social_icons).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    SliderContextPanel.click_context_item align
  end
end