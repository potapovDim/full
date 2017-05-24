module ElementsPart
  #left nav add apps catalogue
  #css selectors
  @button = '[data-test="thumbnail-button"]'
  @text = '[data-test="thumbnail-text"]'
  @line = '[data-test="thumbnail-line"]'
  @icon = '[data-test="thumbnail-icon"]'
  @image = '[data-test="thumbnail-image"]'
  #initialize browser
  @browser
  def self.initBrowser(browser)
    @browser = browser
    return self
  end
  #apps left nav methods
  def self.add_element_from_catalogue(x, y, element="text")
    case element
      when "text"
        @browser.element(css: @text).hover
        @browser.element(css: @text).drag_and_drop_by x, y
      when "button"
        @browser.element(css: @button).hover
        @browser.element(css: @button).drag_and_drop_by x, y
      when "line"
        @browser.element(css: @line).hover
        @browser.element(css: @line).drag_and_drop_by x, y
      when "icon"
        @browser.element(css: @icon).hover
        @browser.element(css: @icon).drag_and_drop_by x, y
      when "image"
        @browser.element(css: @image).hover
        @browser.element(css: @image).drag_and_drop_by x, y
    end
    return self
  end
end