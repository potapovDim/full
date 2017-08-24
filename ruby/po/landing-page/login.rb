class Login
  def initialize(driver)
    @browser = driver
    @email_input                  = 'input#id5'
    @password_input               = 'input#id9'
    @login_button                 = 'button[title="Login"]'
    @alarm_ico_login_form         = '.icon.icon_alarm.icon_absolute_right'
    @error_input_message          = '.field__message'
  end
   #party enter and warnings data
  def get_input_error(field)
    error_name = nil
    error_pass = nil
    case field
      when 'name'
        error_name = @browser.elements(css: @error_input_message)[3]
        return error_name, self
      when 'pass'
        error_pass = @browser.elements(css: @error_input_message)[4]
        return error_pass, self
      when 'both'
        error_name = @browser.elements(css: @error_input_message)[3]
        error_pass = @browser.elements(css: @error_input_message)[4]
        return error_name, error_pass, self
    end
  end
  def set_mail_input(username)
    @browser.element(css: @email_input).focus
    for i in 0..@browser.element(css: @email_input).value.length - 1
      @browser.send_keys :backspace
    end
    @browser.element(css: @email_input).send_keys username
    return self
  end
  def set_pass_input(pass)
    @browser.element(css: @password_input).focus
    for i in 0..@browser.element(css: @password_input).value.length - 1
      @browser.send_keys :backspace
    end
    @browser.element(css: @password_input).send_keys pass
    return self
  end
  def submit_login
    @browser.element(css: @login_button).click
    return self
  end
  #success login
  def success_login_user(username, password)
    set_mail_input username
    set_pass_input password
    submit_login
    sleep 1
    return Account.new @browser
  end
  def get_invalid_fields
    return @browser.elements(css: @not_valid_field), self
  end
  #fail login
  def fail_login_user(username, pass)
    set_mail_input username
    set_pass_input pass
    submit_login
    return @browser.element(text: "Invalid email or password"), self
  end
end