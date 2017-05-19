require_relative './my-profile'
require_relative '../landing-page/plan'

class Account
  include MyProfile
  include Plan
  #inititalize class variables
  def initialize(driver)
    @browser                        = driver
    @back_landing                   = 'button.logo'
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
end