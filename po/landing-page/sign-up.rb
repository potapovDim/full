module SignUp
  @email_input                  = 'input[name="email"]'
  @name_input                   = 'input[name="name"]'
  @password_input               = 'input[name="password"]'
  @signup_button                = 'button[type="submit"]'
  @accept_terms                 = '#terms'
  @captcha                      = '.recaptcha-checkbox-checkmark'  
  def self.initialize(driver)
    @browser = driver
    self
  end
  def self.signup_user(username, password)
    @browser.element(css: @email_input).send_keys username
    @browser.element(css: @password_input).send_keys password
    @browser.element(css: login_button).click
  end
  
end