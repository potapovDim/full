module MyProfile
  #personal information
  @first_name = 'input[name="sign-up-name"]'
  @last_name = 'input[name="sign-up-l-name"]'
  @phone_number = 'input[name="phone-num"]'
  @street_address1 = 'input[name="address-1"]'
  @street_address2 = 'input[name="address-2"]'
  @city_name = 'input[name="city"]'
  @state_region = 'input[name='region']'
  @country = '#contry'
  @country_option = 'option'
  #change password part
  @old_password = 'input[name="old-pswd"]'
  @new_password = 'input[name="new-pswd"]'
  @new_password_confirm = 'input[name="new-pswd-confirm"]'
  #init driver instance
  def self.initialize(driver)
    @browser = driver
    self
  end
  #positive methods
  def self.change_first_name(name)
    @browser.element(css: @first_name).send_keys name
    return self
  end
  def self.change_last_name(last_name)
    @browser.element(css: @last_name).send_keys last_name
    return self
  end
  def self.change_phone_number(phone_number)
    @browser.element(css: @phone_number).send_keys phone_number
    return self
  end
  def self.change_street_address1(address)
    @browser.element(css: @street_address1).send_keys address
    return self
  end
  def self.change_street_address2(address)
    @browser.element(css: @street_address2).send_keys address
    return self
  end
  def self.change_city_name(city_name)
    @browser.element(css: @city_name).send_keys city_name
    return self
  end
  def self.change_region(region)
    @browser.element(css: @state_region).send_keys region
    return self
  end
  def self.select_new_country(count)
    
  end
end