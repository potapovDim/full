class Login
  def initialize(driver)
    @browser = driver
    @email_input                  = 'input#id5'
    @password_input               = 'input#id9'
    @login_button                 = 'button[title="Login"]'
    @alarm_ico_login_form         = '.icon.icon_alarm.icon_absolute_right'
    @error_input_message          = '.field__message'
    @go_to_facebook               = '.btn_social_facebook'
    @go_to_google                 = '.btn_social_google'
    @go_to_forgot_pass            = 'a[href="/reset_password"]'
    #fb-page
    @fb_login_input               = '#email'
    @fb_pass_input                = '#pass'
    @fb_login_button              = '#loginbutton'
    #google page
    @google_login_input           = '#identifierId'
    @google_pass_input            = 'input[type="password"]'
    @next                         = '#identifierNext' 
    @passNext                     = '#passwordNext'

  end
   #party enter and warnings data
  def get_input_error(field)
    error_name = nil
    error_pass = nil
    case field
      when 'name'
        error_name = @browser.elements(css: @error_input_message)[0]
        return error_name, self
      when 'pass'
        error_pass = @browser.elements(css: @error_input_message)[1]
        return error_pass, self
      when 'both'
        error_name = @browser.elements(css: @error_input_message)[0]
        error_pass = @browser.elements(css: @error_input_message)[1]
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

  def login_fields_presented?
    return @browser.element(css: @email_input).present? && 
           @browser.element(css: @password_input).present?
  end
  def go_to_fb_login 
    @browser.element(css: @go_to_facebook ).click
    return self
  end
  def facebook_login(username, password)
    @browser.element(css: @fb_login_input).send_keys username
    @browser.element(css: @fb_pass_input).send_keys password
    @browser.element(css: @fb_login_button).click
  end

  def go_to_google_login 
    @browser.element(css: @go_to_google ).click
    return self
  end
  def google_login(username, password)
    @browser.element(css: @google_login_input).send_keys username
    @browser.element(css: @next).click   
    @browser.element(css: @google_pass_input).send_keys password
    @browser.element(css: @passNext ).click  
    sleep 0.5
  end
  def go_to_signup
    @browser.element(text: 'Create account').click
    return SignUp.new(@browser)
  end
  def go_to_forgot_pass
    @browser.element(css: @go_to_forgot_pass).click
    return PassRecovery.new(@browser)
  end
end