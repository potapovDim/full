require_relative "./context-panel"

class SocialShare
  include SocialShareContextPanel
  #css selectors
  @@draggable_social_share = '[data-test="draggable-element-social-share"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    SocialShareContextPanel.initBrowser @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_social_share).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    SocialShareContextPanel.click_context_item align
  end
end