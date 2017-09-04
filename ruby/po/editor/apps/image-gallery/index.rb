require_relative "../context-panel.rb"

class ImageGallery
  include ContextPanel
  #css selectors
  @@draggable_image_gallery = '[data-test="draggable-element-image-gallery"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanel.initDriver @@browser
    ContextPanel.init_element_selector @@draggable_image_gallery    
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_image_gallery).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ContextPanel.click_context_item align
  end
end