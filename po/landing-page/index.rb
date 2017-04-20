require_relative './login'
require_relative './pricing'

class LandingPage
  include Login
  include Pricing
  #inititalize class variables
  def initialize(driver)
    #webdriver instance
    @browser                  = driver
    #main selectors
    @user_login               = 'a[title="Log in"]'
    @user_signup              = 'a[title="Sign up"]'
    @get_started              = 'a[title="Get started"]'
    @signup_and_freetrial     = 'a[title="Sign up and start trial now"]'
    #footer part lading
    #products
    @footer_list_item          = '.footer-list__item'
    @pricing = 'a[href="/pricing"]'
  end

  def helper_contextpanel(index)
    while @browser.elements(css: @footer_list_item)[index].present? == false
      @browser.execute_script("window.scrollBy(0, 1000)")
    end
    return true
  end

  def login
    @browser.element(css: @user_login).fire_event 'click'
    return Login.initDriver(@browser)
  end
  def get_started_login
    @browser.element(css: @get_started).fire_event 'click'
    @browser.label(text: 'Login').fire_event 'click'
    return Login.initDriver(@browser)
  end
  
  def signup_and_freetrial_login
    @browser.element(css: @signup_and_freetrial).fire_event 'hover'
    @browser.element(css: @signup_and_freetrial).fire_event 'click'
    @browser.label(text: 'Login').fire_event "click"
    return Login.initDriver(@browser)
  end

  def pricing_page
    @browser.execute_script("window.scrollBy(0, 150000)")
    @browser.element(css: @pricing).click
    return Pricing.initDriver(@browser)
  end
end