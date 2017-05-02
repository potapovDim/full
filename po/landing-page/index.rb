require_relative './login'
require_relative './pricing'
require_relative './concepts'

class LandingPage
  include Login
  include Pricing
  include Concepts
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
    @footer_list_item         = '.footer-list__item'
    #header items
    @header_about_us          = 'a[title="About us"]'
    @header_concepts          = 'a[title="Concepts"]'
    @header_pricing           = 'a[title="Pricing"]'
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
    @browser.label(text: 'Log in').fire_event 'click'
    return Login.initDriver(@browser)
  end
  
  def signup_and_freetrial_login
    @browser.element(css: @signup_and_freetrial).fire_event 'hover'
    @browser.element(css: @signup_and_freetrial).fire_event 'click'
    @browser.label(text: 'Log in').fire_event "click"
    return Login.initDriver(@browser)
  end

   def header_pricing_page
    @browser.element(css: @header_pricing).click
    return Pricing.initDriver(@browser)
  end

  def header_concepts_page
    @browser.element(css: @header_concepts).click
    return Concepts.initDriver(@browser)
  end
  def go_to_footer
    @browser.execute_script("window.scrollBy(0, 150000)")
    return Footer().initDriver(@browser)
  end
end