module Spacer
  #css selector 
  @spacer = '[data-test="spacer"]'
  @spacer_hovered = '[data-test="spacer-hover"]'
  #browser instance
  @browser
  @spacer_value
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
    return self, @browser.elements(css: @spacer)
  end
  def self.get_spacer_value
    return self, @spacer_value
  end
  #resize spacer
end