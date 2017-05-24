require_relative "./context-panel"

class SocialIcons
  include SocialIconsContextPanel
  #css selectors
  @@draggable_social_icons = '[data-test="draggable-element-social-icons"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    SocialIconsContextPanel.initBrowser @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_social_icons).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    SocialIconsContextPanel.click_context_item align
  end
end