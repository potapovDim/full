require_relative './login'

module Concepts
  #concepts selectors
  @concept                    = 'img[alt="concept name"]'
  @start_your_website         = 'button[title="Start website"]'
  @search_input               = 'input.field__input'

  #initialize webdriver 
  def self.initDriver(driver)
    @Login = Login.initDriver driver
    @browser = driver
    return self
  end
  
  #method
  def self.go_to_login
    @browser.elements(css: @concept)[0].fire_event 'hover'
    @browser.element(css: @start_your_website).fire_event 'click'
    return @Login
  end
end
