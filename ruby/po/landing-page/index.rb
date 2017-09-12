class LandingPage
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
    @weblium_left_icon        = 'a[title="Home"]'
    @logo                     = '.logo'
    
    #on terms page
    @privacy_policy           = 'a[title="Privacy Policy"]'
    #privacy page
    @terms                    = 'a[title="Terms of Use"]'
  end

  def go_to_privacy_policy_form_terms
    @browser.element(css: @privacy_policy).fire_event 'click'
  end
  def go_to_terms_from_privacy
    @browser.element(css: @terms).fire_event 'click'
  end
  def go_to_landing
    @browser.element(css: @weblium_left_icon).fire_event 'click'
    return self
  end

  def helper_contextpanel(index)
    while @browser.elements(css: @footer_list_item)[index].present? == false
      @browser.execute_script("window.scrollBy(0, 1000)")
    end
    return true
  end

  def go_to_about_us
    @browser.element(css: @header_about_us).fire_event 'click'
  end

  def login
    @browser.element(css: @user_login).fire_event 'click'
    return Login.new @browser
  end

  def get_started_login
    @browser.element(css: @get_started).fire_event 'click'
    # @browser.label(text: 'Log in').fire_event 'click'
    return Login.new @browser
  end
  
  def signup_and_freetrial_login
    @browser.element(css: @signup_and_freetrial).fire_event 'hover'
    @browser.element(css: @signup_and_freetrial).fire_event 'click'
    # @browser.label(text: 'Log in').fire_event "click"
    return Login.new @browser
  end

   def header_pricing_page
    @browser.element(css: @header_pricing).click
    return Pricing.new @browser
  end

  def header_concepts_page
    @browser.element(css: @header_concepts).click
    return Concepts.new @browser
  end
  def go_to_footer
    @browser.execute_script("window.scrollBy(0, 150000)")
    return Footer.new @browser
  end
  def go_to_home_by_logo
    @browser.element(css: @logo).click
  end
end