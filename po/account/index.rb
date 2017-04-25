class Account
  #inititalize class variables
  def initialize(driver)
    @browser                       = driver
    @my_profile                    = 'a[href="/myaccount/account/profile"]' 
    @my_websites                   = 'a[href="/myaccount/account/websites"]' 
  end
end