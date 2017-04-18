require_relative './login'

class LandingPage
  include Login
  #inititalize class variables
  def initialize(driver, username, password)
    #user data 
    @username                 = username
    @password                 = password
    #webdriver instance
    @browser                  = driver
    #main selectors
    @user_login               = 'a[title="Log in"]'
    @user_signup              = 'a[title="Sign up"]'
    @get_started              = 'a[title="Get started"]'
    @signup_and_freetrial     = 'a[title="Sign up and start trial now"]' 
  end
  def login
    @browser.element(css: @user_login).fire_event "click"
    Login.initDriver(@browser).login_user(@username, @password)
  end
  def login_falin
    @browser.element(css: @user_login).fire_event "click"
    Login.initDriver(@browser).fail_login_user
  end
end