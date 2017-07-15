module Login
  @email_input                  = 'input#id5'
  @password_input               = 'input#id9'
  @login_button                 = 'button[title="Login"]'
  @alarm_ico_login_form         = '.icon.icon_alarm.icon_absolute_right'
  @not_valid_field              = '.field_invalid'
  
  def self.initDriver(driver)
    @browser = driver
    return self
  end
  def self.login_user(username, password)
    @browser.element(css: @email_input).send_keys username
    @browser.element(css: @password_input).send_keys password
    @browser.element(css: @login_button).click
    @browser.element(css: ".menu__link.ico.ring-ico").fire_event 'hover'
    return Account.new @browser
  end
  def self.get_invalid_fields
    return @browser.elements(css: @not_valid_field), self
  end
  def self.fail_login_user(*args)
    email = "12311232132121@213123123"
    pass = "12311232132121@213123123"
    if args.length != 0
      email = args[0]  
      pass = args[1]
      pattern = args[2]
    end
    if pattern
      @browser.element(css: @email_input).send_keys email
      @browser.element(css: @password_input).send_keys pass
      @browser.element(css: @login_button).click
      return self
    end
    @browser.element(css: @email_input).send_keys email
    @browser.element(css: @password_input).send_keys pass
    @browser.element(css: @login_button).click
    return @browser.element(text: "Invalid email or password"), self
  end
end