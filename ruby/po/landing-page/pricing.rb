require_relative './login'

module Pricing
  #include Login
  #pricing selectors
  @buy_growth_plan                  = 'a[title="Buy growth plan"]' # 0 green button , 1 test plan , 2 monthy , 4 annually
  @plan_feature                     = '.plan__feature' # Moneyback guarantee ; 14 days for free
  @sign_up_button                   = 'a[title="Sign up"]' #0 top right button , 1 green centred button
  
  #initialize webdriver 
  def self.initDriver(driver)
    @Login = Login.initDriver driver #
    @browser = driver
    return self
  end
  #methods
  def self.success_login_by_growth_plan(growth_plan_position = 0)
    case growth_plan_position
      when 0 #login by green button 
        @browser.elements(css: @buy_growth_plan)[0].fire_event 'click'
      when 1 #login by first plan -> test plan
        @browser.elements(css: @buy_growth_plan)[1].fire_event 'click'
      when 2 #login by second plan -> monthly plan
        @browser.elements(css: @buy_growth_plan)[2].fire_event 'click'
      when 3 #login by first plan -> annually plan
        @browser.elements(css: @buy_growth_plan)[3].fire_event 'click'
    end
    return @Login
  end

  def self.success_login_by_sign_up_centred
    @browser.elements(css: @sign_up_button)[1].fire_event 'click' # click centred sign up (green button)
    @browser.label(text: 'Login').fire_event "click"
    return Login.initDriver(@browser)
  end

  def self.back_home
    @browser.element(css '[title="Home"]').fire_event 'click'
  end
end