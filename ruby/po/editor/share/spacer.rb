class Spacer
  def initialize(browser)
    @browser = browser
    #css selector 
    @spacer                   = '[data-test="spacer"]'
    @spacer_hovered           = '[data-test="spacer-hover"]'
    #browser instance
    @browser
    @spacer_value = nil
  end
  
  #hovered spacer
  def hovered_spacer
    return @browser.elements(css: @spacer_hovered)
  end
  #not hovered spacer
  def unhovered_spacer
    return @browser.elements(css: @spacer), self
  end
  def get_spacer_value
    return @spacer_value, self
  end
  #resize spacer
end