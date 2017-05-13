require_relative './my-profile'

class Account
  include MyProfile
  #inititalize class variables
  def initialize(driver)
    @browser                       = driver
    @my_profile                    = 'a[href="/myaccount/account/profile"]' 
    @my_websites                   = 'a[href="/myaccount/account/websites"]' 
  end
  #navigation methods
  def go_to_my_profile
    @browser.element(text: 'My profile').click
    return MyProfile.initialize(@browser)
  end
end