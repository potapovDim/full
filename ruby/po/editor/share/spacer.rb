module Spacer
  #css selector 
  @spacer                   = '[data-test="spacer"]'
  @spacer_hovered           = '[data-test="spacer-hover"]'
  #browser instance
  @browser
  @spacer_value = nil
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #hovered spacer
  def self.hovered_spacer
    return @browser.elements(css: @spacer_hovered)
  end
  #not hovered spacer
  def self.unhovered_spacer
    return @browser.elements(css: @spacer), self
  end
  def self.get_spacer_value
    return @spacer_value, self
  end
  #resize spacer
end