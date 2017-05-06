module MyProfile
  #personal information
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
  #email notification
  @monthly_news                         = 'input#keepSigned2'
  @important_updates                    = 'input#keepSigned3' 
  @security_updates                     = 'input#keepSigned4'
  #user data 
  @user_full_name                       = '.panel__header' # full name is concat two fields First name and Last name
  @user_data_IDS                        = '.text-list'
  #init driver instance
  def self.initialize(driver)
    @browser = driver
    self
  end
  #positive methods
  def self.change_first_name(name)
    @browser.element(css: @first_name).wait_until_present.to_subtype.clear
    @browser.element(css: @first_name).send_keys name
    return self
  end
  def self.change_last_name(last_name)
    @browser.element(css: @last_name).wait_until_present.to_subtype.clear
    @browser.element(css: @last_name).send_keys last_name
    return self
  end
  def self.change_phone_number(phone_number)
    @browser.element(css: @phone_number).wait_until_present.to_subtype.clear
    @browser.element(css: @phone_number).send_keys phone_number
    return self
  end
  def self.change_street_address1(address)
    @browser.element(css: @street_address1).wait_until_present.to_subtype.clear
    @browser.element(css: @street_address1).send_keys address
    return self
  end
  def self.change_street_address2(address)
    @browser.element(css: @street_address2).wait_until_present.to_subtype.clear
    @browser.element(css: @street_address2).send_keys address
    return self
  end
  def self.change_city_name(city_name)
    @browser.element(css: @city_name).wait_until_present.to_subtype.clear
    @browser.element(css: @city_name).send_keys city_name
    return self
  end
  def self.change_region(region)
    @browser.element(css: @state_region).wait_until_present.to_subtype.clear
    @browser.element(css: @state_region).send_keys region
    return self
  end
  def self.change_postal_code(code)
    @browser.element(css: @postal_code).wait_until_present.to_subtype.clear
    @browser.element(css: @postal_code).send_keys code
    return self
  end
  def self.select_new_country(count)
    @browser.element(css: @country).click
    @browser.elements(css: @country_option)[count].click
    return self
  end
  def self.save_new_user_info_button(positive = true)
    @browser.button(text: 'Save info').click
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
  def self.go_to_change_password
    @browser.element(css: @go_to_change_password).click
    return self
  end
  def self.change_password(old_pass, new_pass, positive = true)
    @browser.element(css: @old_password).send_keys old_pass 
    @browser.element(css: @new_password).send_keys new_pass
    @browser.element(css: @new_password_confirm).send_keys new_pass
    @browser.button(text: 'Change password').click
    condition = true
    if positive
      while condition do
        if @browser.button(text: 'Changes saved').present?
          condition = false
        end
      end
      return self, 'Password success changed'
    end
    while condition do
        if @browser.button(text: 'Failed to save changes').present?
          condition = false
        end
      end
    return self, 'Password success saved'
  end
  def self.change_notification(notification)
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
  def self.get_user_name_last_name
    return @browser.elements(css: @user_full_name)[0].text, self
  end
  def self.get_data_from_form(row)
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
end
