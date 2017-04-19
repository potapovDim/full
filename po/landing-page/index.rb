require_relative './login'

class LandingPage
  include Login
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
    @futer_list_item          = '.footer-list__item'
  end
  def login
    @browser.element(css: @user_login).fire_event "click"
    return Login.initDriver(@browser)
  end
  def get_started_login
    @browser.element(css: @get_started).fire_event "click"
    @browser.label(text: 'Login').fire_event "click"
    return Login.initDriver(@browser)
  end
  def signup_and_freetrial_login
    @browser.element(css: @signup_and_freetrial).fire_event "hover"
    @browser.element(css: @signup_and_freetrial).fire_event "click"
    @browser.label(text: 'Login').fire_event "click"
    return Login.initDriver(@browser)
  end
end