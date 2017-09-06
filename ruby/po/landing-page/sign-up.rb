class SignUp
  def initialize(driver)
    @browser = driver
    @email_input                  = 'input[name="email"]'
    @name_input                   = 'input[name="name"]'
    @password_input               = 'input[name="password"]'
    @signup_button                = 'button[type="submit"]'
    @accept_terms                 = '#terms'
    @captcha                      = '.recaptcha-checkbox-checkmark'  
  end
  def signup_user(username, password)
    @browser.element(css: @email_input).send_keys username
    @browser.elements(css: @password_input)[0].send_keys password
    @browser.elements(css: @password_input)[1].send_keys password
    @browser.element(css: @terms).click
    @browser.element(css: @captcha).click
    @browser.element(css: @signup_button).click
  end
end
