require_relative "./context-panel"

class Video
  include VideoContextPanel
  #css selectors
  @@draggable_video = '[data-test="draggable-element-video"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    VideoContextPanel.initBrowser @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_video).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    VideoContextPanel.click_context_item align
  end
end