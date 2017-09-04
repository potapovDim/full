require_relative "../context-panel.rb"

class Video
  include ContextPanel
  #css selectors
  @@draggable_video = '[data-test="draggable-element-video"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanel.initDriver @@browser
    ContextPanel.init_element_selector @@draggable_social_share                    
  end
  #methods
  def focus_element
    @@browser.element(css: @@draggable_video).wait_until_present
    @@browser.element(css: @@draggable_video).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ContextPanel.click_context_item align
  end
end