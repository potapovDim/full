module Login
  @email_input                  = 'input[name="email"]'
  @password_input               = 'input[name="password"]'
  @login_button                 = 'button[title="Login"]'

  def self.initialize(driver)
    @browser = driver
    self
  end
  def self.login_user(username, password)
    @browser.element(css: @email_input).send_keys username
    @browser.element(css: @password_input).send_keys password
    @browser.element(css: @login_button).click
  end
end