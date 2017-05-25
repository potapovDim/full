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
    return Account.new @browser
  end
  def self.fail_login_user(*args)
    email = "12311232132121@213123123"
    pass = "12311232132121@213123123"
    if args.length != 0
      email = args[0]  
      pass = args[1]  
    end
      @browser.element(css: @email_input).send_keys email
      @browser.element(css: @password_input).send_keys pass
      @browser.element(css: @login_button).click
      return @browser.element(text: "Invalid email or password")
  end
end