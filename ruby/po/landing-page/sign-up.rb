class SignUp
  def initialize(driver)
    @browser = driver
    @email_input                  = '#id1'
    @name_input                   = 'input[name="name"]'
    @password_input               = 'input#id2'
    @signup_button_text           = 'Sign up and start my website'
    @captcha                      = '.recaptcha-checkbox-checkmark'
    @error_input_messages         = '.field__message'
  end
  def set_inputs(username, email, password)
    set_name(name)  
    set_email(email)
    set_password(password)
  end
  def set_email (email)
    @browser.element(css: @email_input).to_subtype.clear
    @browser.element(css: @email_input).send_keys email
  end
  def set_name (name)
    @browser.element(css: @name_input).to_subtype.clear
    @browser.element(css: @name_input).send_keys name
  end
  def set_pass (pass)
    @browser.element(css: @password_input).to_subtype.clear
    @browser.element(css: @password_input).send_keys pass
  end
  def click_submit
    @browser.element(text: @signup_button_text).click    
  end
  def get_name_error
   return  @browser.elements(css: @error_input_messages)[2].text
  end   
  def get_email_error
    return @browser.elements(css: @error_input_messages)[3].text
  end   
  def get_pass_error
    return @browser.elements(css: @error_input_messages)[4].text
  end 
  def drop_focus
     @browser.element(css: @name_input).focus   
  end
  
end
