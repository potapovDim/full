require_relative "./context-panel"

class ImageGallery
  include ImageGalleryContextPanel
  #css selectors
  @@draggable_image_gallery = '[data-test="draggable-element-image-gallery"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    ImageGalleryContextPanel.initBrowser @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_image_gallery).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    ImageGalleryContextPanel.click_context_item align
  end
end