require_relative '../../scripts/index.rb'

# , :focus => true if need run only this suit
#test case coverage <75-102>
describe 'User profile' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
  end
  #positive cases
  it 'change user data' do
    new_user_firstname = 'test'
    user_name, myProfile = @landing
                    .login()
                    .success_login_user(@username, @password)
                    .go_to_my_profile()
                    .change_first_name(new_user_firstname)
                    .save_new_user_info_button(true, false)
                    .get_user_name_last_name()
    expect(user_name.include? new_user_firstname).to eql(true)

    new_user_lastname = 'test'
    user_name, myProfile = myProfile.change_last_name(new_user_lastname)
                    .save_new_user_info_button(true, false)
                    .get_user_name_last_name()
    expect(user_name.include? new_user_lastname).to eql(true)


    new_user_firstname = 'test_fir'
    new_user_lastname = 'test_last'
    user_name, myProfile = myProfile.change_last_name(new_user_lastname)
                    .change_first_name(new_user_firstname)
                    .save_new_user_info_button(true, false)
                    .get_user_name_last_name()
    expect(user_name.include? new_user_firstname).to eql(true)
    expect(user_name.include? new_user_lastname).to eql(true)

    adrs1 = 'testAddress1'
    adrs2 = 'testAddress2'
    profile = myProfile.change_street_address1(adrs1)
                    .change_street_address2(adrs2)
                    .save_new_user_info_button(true, false)
    @browser.refresh
    address1_2, page = profile.get_data_from_form(2)
    expect(address1_2[:adr1]).to eql(adrs1)
    expect(address1_2[:adr2]).to eql(adrs2)

    city = 'test city'
    region = 'test region'
    profile = myProfile.change_city_name(city)
                    .change_region(region)
                    .save_new_user_info_button(true, false)
    @browser.refresh
    city_reg, page = profile.get_data_from_form(3)
    expect(city_reg[:city]).to eql(city)
    expect(city_reg[:region]).to eql(region)

    postal_code = "22222222"
    profile = myProfile.change_postal_code(postal_code)
                    .select_new_country(1)
                    .save_new_user_info_button(true, false)
    @browser.refresh
    code, page = profile.get_data_from_form(4)
    expect(code).to eql(postal_code)

    new_password = @password
    message, profile = myProfile
                    .go_to_change_password()
                    .change_password_with_button_assert(@password, new_password, new_password, true)
    expect(message).to eql('Password success changed')
  end
  it 'change user first name (negative)' do
    new_user_name = Array.new(300).join('1')
    user_name, my_profile = @landing
                    .login()
                    .success_login_user(@username, @password)
                    .go_to_my_profile()
                    .change_first_name(new_user_name)
                    .save_new_user_info_button(false, true)
                    .get_user_name_last_name()
    expect(user_name.include? new_user_name).to eql(false)
    expect(my_profile.get_exception_data_from_field(0)).not_to eql('')
    expect(my_profile.get_exception_data_from_field(0)).not_to eql(nil)
  end
  it 'change user last name (negative)'  do
    new_user_lastname = Array.new(300).join('2')
    user_name, my_profile = @landing
                    .login()
                    .success_login_user(@username, @password)
                    .go_to_my_profile()
                    .change_last_name(new_user_lastname)
                    .save_new_user_info_button(false, true)
                    .get_user_name_last_name()
    expect(user_name.include? new_user_lastname).to eql(false)
    expect(my_profile.get_exception_data_from_field(0)).not_to eql('')
    expect(my_profile.get_exception_data_from_field(0)).not_to eql(nil)
  end
  it 'change address (negative)' do
    adrs1 = Array.new(300).join('1')
    adrs2 = Array.new(300).join('2')
    my_profile = @landing
                    .login()
                    .success_login_user(@username, @password)
                    .go_to_my_profile()
                    .change_street_address1(adrs1)
                    .save_new_user_info_button(false, true)
                    .change_street_address2(adrs2)
                    .save_new_user_info_button(false, true)
    expect(my_profile.get_exception_data_from_field(0)).not_to eql('')
    expect(my_profile.get_exception_data_from_field(0)).not_to eql(nil)
    @browser.refresh
    address1_2, page = my_profile.get_data_from_form(2)
    expect(address1_2[:adr1]).not_to eql(adrs1)
    expect(address1_2[:adr2]).not_to eql(adrs2)
  end
  it 'change city region (negative)' do
    city = Array.new(300).join('1')
    region = Array.new(300).join('2')
    my_profile = @landing
                    .login()
                    .success_login_user(@username, @password)
                    .go_to_my_profile()
                    .change_city_name(city)
                    .change_region(region)
                    .save_new_user_info_button(false, true)
    expect(my_profile.get_exception_data_from_field(0)).not_to eql('')
    expect(my_profile.get_exception_data_from_field(0)).not_to eql(nil)
    @browser.refresh
    city_reg, page = my_profile.get_data_from_form(3)
    expect(city_reg[:city]).not_to eql(city)
    expect(city_reg[:region]).not_to eql(region)
  end
end
#test case coverage <69 70 71 72 73 74>
describe 'Change password' do 
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
    @landing.login()
            .success_login_user(@username, @password)
            .go_to_my_profile()
            .go_to_change_password()
    @profile = MyProfile.new(@browser)
  end
#negative cases
  it 'change user password (negative)' do
    NEW_PASS = '123321123'
    message, @profile = @profile
                    .change_password_with_button_assert('123123', NEW_PASS, NEW_PASS, false)
    expect(message).to eql('Failed to change password')
  end
  it 'password validation' do
    @profile.change_password('','','')
    expect(@profile.get_exception_data_from_field(0)).to eql('This filed is required')
    expect(@profile.get_exception_data_from_field(1)).to eql('This filed is required')
    expect(@profile.get_exception_data_from_field(2)).to eql('This filed is required')
  #Changing password with invalid old password.
    message, @profile = @profile.change_password_with_button_assert('invalid_pass', NEW_PASS, NEW_PASS,false)
    expect(@profile.get_exception_data_from_field(0)).to eql('Old password is incorrect')
    expect(message).to eql('Failed to change password')
  #Changing password with invalid "re type password".
    @profile.clear_password_fields.change_password(@password, NEW_PASS, NEW_PASS + '1')
    expect(@profile.get_exception_data_from_field(0)).to eql('Should be equal to "New password" field')
  #Changing password with new password length 5 symbols.
    @profile.clear_password_fields.change_password(@password, '12345','12345')
    expect(@profile.get_exception_data_from_field(0)).to eql('This filed should be at least 6 characters long')    
  end
end
