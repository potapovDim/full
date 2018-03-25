class Account
  #include MyProfile
  #inititalize class variables
  def initialize(driver)
    @browser                        = driver
    @back_landing                   = 'button.logo'
    @left_nav_item                  = '.left-nav__item'
    @my_profile                     = 'a[href="/myaccount/account/profile"]' 
    @my_websites                    = 'a[href="/myaccount/account/websites"]' 
    @buy_growth_plan_button         = '[data-test="Buy Growth Plan"]'
  end
  #navigation methods
  def go_to_my_profile
    @browser.element(text: 'My profile').click
    return MyProfile.new @browser
  end
  def buy_growth_plan
    @browser.element(css: @buy_growth_plan_button).click
    return Plan.new @browser
  end
  def go_to_landing
    @browser.element(css: @back_landing).click
  end

  def go_to_my_websites
    @browser.elements(css: @left_nav_item)[0].click
    return MyWebsites.new @browser
  end
end