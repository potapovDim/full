require_relative "../context-panel.rb"

class Menu
  include ContextPanel
  #css selectors
  @@draggable_menu = '[data-test="draggable-element-menu"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanel.initDriver @@browser
    ContextPanel.init_element_selector @@draggable_menu     
    
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_menu).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ContextPanel.click_context_item align
  end
end