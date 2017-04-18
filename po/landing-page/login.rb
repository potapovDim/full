module Login
  @email_input                  = 'input#id5'
  @password_input               = 'input#id9'
  @login_button                 = 'button[title="Login"]'
  @alarm_ico_login_form         = '.icon.icon_alarm.icon_absolute_right'
  def self.initDriver(driver)
    @browser = driver
    return self
  end
  def self.login_user(username, password)
    @browser.element(css: @email_input).send_keys username
    @browser.element(css: @password_input).send_keys password
    @browser.element(css: @login_button).click
    @browser.element(css: "a.menu__link.ico.ring-ico").fire_event 'hover'
  end
  def self.fail_login_user
    @browser.element(css: @email_input).send_keys "12311232132121@213123123"
    @browser.element(css: @password_input).send_keys "12311232132121@213123123"
    @browser.element(css: @login_button).click
    return @browser.element(text: "Invalid email or password")
  end
end