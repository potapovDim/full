require_relative "../../context-panel/context-panel"

class ImageGallery
  #css selectors
  @@draggable_image_gallery = '[data-test="draggable-element-gallery"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_image_gallery).fire_event "mousedown"
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_image_gallery)
  end
end