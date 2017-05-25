require_relative './my-profile'
require_relative './my-websites'
require_relative '../landing-page/plan'

class Account
  #include MyProfile
  #inititalize class variables
  def initialize(driver)
    @browser                        = driver
    @back_landing                   = 'button.logo'
    @left_nav_item                  = '.left-nav__item'
    @my_profile                     = 'a[href="/myaccount/account/profile"]' 
    @my_websites                    = 'a[href="/myaccount/account/websites"]' 
    @buy_growth_plan_button         = 'button.btn.btn_green.trial-notice__btn'
  end

  #navigation methods
  def go_to_my_profile
    @browser.element(text: 'My profile').click
    return MyProfile.initDriver(@browser)
  end
  def buy_growth_plan
    @browser.element(css: @buy_growth_plan_button).click
    return Plan.initDriver(@browser)
  end
  def go_to_landing
    @browser.element(css: @back_landing).click
  end

  def go_to_my_websites
    @browser.elements(css: @left_nav_item)[0].click
    return MyWebsites.initDriver(@browser)
  end
end