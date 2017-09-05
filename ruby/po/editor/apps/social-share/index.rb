require_relative "../../context-panel/context-panel"

class SocialShare
  #css selectors
  @@draggable_social_share = '[data-test="draggable-element-social-share"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser            
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_social_share).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_social_share)
  end
end