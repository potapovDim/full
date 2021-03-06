class MyProfile
  #personal information
 
  #init driver instance
  def initialize(driver)
    @browser = driver
    @first_name                           = 'input[name="sign-up-name"]'
    @last_name                            = 'input[name="sign-up-l-name"]'
    @phone_number                         = 'input[name="phone-num"]'
    @street_address1                      = 'input[name="address-1"]'
    @street_address2                      = 'input[name="address-2"]'
    @city_name                            = 'input[name="city"]'
    @state_region                         = 'input[name="region"]'
    @postal_code                          = 'input[name="zip"]'
    @country                              = '#country'
    @country_option                       = 'option'
    @data_form_row                        = '.row-form'
    #change password part
    @go_to_change_password                = 'a[href="#password-form"]'
    @old_password                         = 'input[name="old-pswd"]'
    @new_password                         = 'input[name="new-pswd"]'
    @new_password_confirm                 = 'input[name="new-pswd-confirm"]'
    @confirm_change                       = '[data-test="Change password"]'
    #email notification
    @monthly_news                         = 'input#keepSigned2'
    @important_updates                    = 'input#keepSigned3' 
    @security_updates                     = 'input#keepSigned4'
    #user data 
    @user_full_name                       = '.panel__header' # full name is concat two fields First name and Last name
    @user_data_IDS                        = '.text-list'
    #exceptions message
    @exceptions_message_data              = 'span.field__message'
  end
  #positive methods
  def change_first_name(name)
    @browser.element(css: @first_name).when_present.to_subtype.clear
    @browser.element(css: @first_name).send_keys name
    return self
  end
  def change_last_name(last_name)
    @browser.element(css: @last_name).when_present.to_subtype.clear
    @browser.element(css: @last_name).send_keys last_name
    return self
  end
  def change_phone_number(phone_number)
    @browser.element(css: @phone_number).when_present.to_subtype.clear
    @browser.element(css: @phone_number).send_keys phone_number
    return self
  end
  def change_street_address1(address)
    @browser.element(css: @street_address1).when_present.to_subtype.clear
    @browser.element(css: @street_address1).send_keys address
    return self
  end
  def change_street_address2(address)
    @browser.element(css: @street_address2).when_present.to_subtype.clear
    @browser.element(css: @street_address2).send_keys address
    return self
  end
  def change_city_name(city_name)
    @browser.element(css: @city_name).when_present.to_subtype.clear
    @browser.element(css: @city_name).send_keys city_name
    return self
  end
  def change_region(region)
    @browser.element(css: @state_region).when_present.to_subtype.clear
    @browser.element(css: @state_region).send_keys region
    return self
  end
  def change_postal_code(code)
    @browser.element(css: @postal_code).when_present.to_subtype.clear
    @browser.element(css: @postal_code).send_keys code
    return self
  end
  def select_new_country(count)
    @browser.element(css: @country).click
    @browser.elements(css: @country_option)[count].click
    return self
  end
  def save_new_user_info_button(positive = true, exception = false)
    # if positive should got "changes saved" after button was clicking
    # if exception shoul get value of exception in field what was changing
    @browser.button(text: 'Save info').click
    if exception
      return self
    end
    condition = true
    if positive
      while condition do
        if @browser.button(text: 'Changes saved').present?
          condition = false
        end
      end
      return self
    end
    while condition do
        if @browser.button(text: 'Failed to save changes').present?
          condition = false
        end
      end
    return self
  end
  def go_to_change_password
    @browser.button(text: 'Change password').click
    return self
  end
  def change_password_with_button_assert(old_pass, new_pass, confirm_pass, positive)
    @browser.element(css: @old_password).send_keys old_pass 
    @browser.element(css: @new_password).send_keys new_pass
    @browser.element(css: @new_password_confirm).send_keys confirm_pass
    @browser.element(css: @confirm_change).click
    condition = true
    if positive
      while condition do
        if @browser.button(text: 'Changes saved').present?
          condition = false
        end
      end
      return 'Password success changed', self
    end
    while condition do
        if @browser.button(text: 'Failed to save changes').present?
          condition = false
        end
      end
    return 'Failed to change password', self
  end
  def change_password(old_pass, new_pass, confirm_pass)
    @browser.element(css: @old_password).send_keys old_pass 
    @browser.element(css: @new_password).send_keys new_pass
    @browser.element(css: @new_password_confirm).send_keys confirm_pass
    @browser.element(css: @confirm_change).click
  end
  def change_notification(notification)
    case notification
      when 'monthly'
        @browser.element(css: @monthly_news).change
      when 'important'
        @browser.element(css: @important_updates).change
      when 'sescurity'
        @browser.element(css: @security_updates).change
    end
    return self
  end
  def get_user_name_last_name
    return @browser.elements(css: @user_full_name)[0].text, self
  end
  def get_data_from_form(row)
    data = nil
    case row
      when 0 #user name and last name 
        data = @browser.elements(css: @data_form_row)[0].text
      when 1 #email and phone number
        data = @browser.elements(css: @data_form_row)[1].text
      when 2 #address 1 and address 2
        data = {
          adr1: @browser.element(css: @street_address1).value,
          adr2: @browser.element(css: @street_address2).value
        }
      when 3 #city and region
        data = {
          city: @browser.element(css: @city_name).value,
          region: @browser.element(css: @state_region).value
        }
      when 4 #postal code and country
        data = @browser.element(css: @postal_code).value
    end
    return data, self
  end
  def clear_password_fields
    max = [@browser.element(css: @old_password).value.length,
           @browser.element(css: @new_password).value.length,
           @browser.element(css: @new_password_confirm).value.length].max
    for i in 0..max
      @browser.element(css: @old_password).send_keys :backspace
      @browser.element(css: @new_password).send_keys :backspace
      @browser.element(css: @new_password_confirm).send_keys :backspace
    end
    return self
  end

  def get_exception_data_from_field(index)
   return @browser.elements(css: @exceptions_message_data)[index].text
  end
end

