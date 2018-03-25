class Image
  #css selectors
  @@draggable_image = '[data-test="draggable-element-image"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser  
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_image).wait_until_present 
    @@browser.element(css: @@draggable_image).fire_event "mousedown" 
  end
  def get_context_panel
    return ContextPanel.new(@@browser,@@draggable_image)
  end
end