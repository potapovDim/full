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
   #party enter and warnings data
  def self.get_input_error(name, password)
    if name 
      return @browser.element(css: @not_valie_field), self
    elseif password
      return @browser.element(css: @not_valie_field), self
    else
      return @browser.elements(css: @not_valie_field), self
    end
  end
  def self.set_mail_input(username)
    @browser.element(css: @email_input).send_keys username
    return self
  end
  def self.set_pass_input(pass)
    @browser.element(css: @email_input).send_keys pass
    return self
  end
  def self.submit_login
    @browser.element(css: @login_button).click
    return self
  end
  #success login
  def self.success_login_user(username, password)
    set_mail_input username
    set_pass_input password
    submit_login
    sleep 1
    return Account.new @browser
  end
  def self.get_invalid_fields
    return @browser.elements(css: @not_valid_field), self
  end
  #fail login
  def self.fail_login_user(username, pass)
    set_mail_input username
    set_pass_input pass
    submit_login
    return @browser.element(text: "Invalid email or password"), self
  end
end