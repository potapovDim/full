require_relative "../../context-panel/context-panel"

class Video
  #css selectors
  @@draggable_video = '[data-test="draggable-element-video"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser                
  end
  #methods
  def focus_element
    @@browser.element(css: @@draggable_video).wait_until_present
    @@browser.element(css: @@draggable_video).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_video)
  end
end