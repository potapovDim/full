require_relative '../../scripts/local.rb'

describe 'Change user profile' do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end
  it 'change user first name' do
    new_user_name = 'test'
    user_name, myProfile = @landing
                    .signup_and_freetrial_login()
                    .login_user(@username, @password)
                    .go_to_my_profile()
                    .change_first_name(new_user_name)
                    .save_new_user_info_button()
                    .get_user_name_last_name()
    expect(user_name.include? new_user_name).to eql(true)
  end
  it 'change user last name' do
    new_user_lastname = 'test'
    user_name, myProfile = @landing
                    .signup_and_freetrial_login()
                    .login_user(@username, @password)
                    .go_to_my_profile()
                    .change_last_name(new_user_lastname)
                    .save_new_user_info_button()
                    .get_user_name_last_name()
    expect(user_name.include? new_user_lastname).to eql(true)
  end
  it 'change user full name' do
    new_user_firstname = 'test_fir'
    new_user_lastname = 'test_last'
    user_name, myProfile = @landing
                    .signup_and_freetrial_login()
                    .login_user(@username, @password)
                    .go_to_my_profile()
                    .change_last_name(new_user_lastname)
                    .change_first_name(new_user_firstname)
                    .save_new_user_info_button()
                    .get_user_name_last_name()
    expect(user_name.include? new_user_firstname).to eql(true)
    expect(user_name.include? new_user_lastname).to eql(true)
  end
  it 'change adress' do
    adrs1 = 'testAddress1'
    adrs2 = 'testAddress2'
    profile = @landing
                    .signup_and_freetrial_login()
                    .login_user(@username, @password)
                    .go_to_my_profile()
                    .change_street_address1(adrs1)
                    .change_street_address2(adrs2)
                    .save_new_user_info_button()
    @browser.refresh
    address1_2, page = profile.get_data_from_form(2)
    expect(address1_2[:adr1]).to eql(adrs1)
    expect(address1_2[:adr2]).to eql(adrs2)
  end
  it 'change city region' do
    city = 'test city'
    region = 'test region'
    profile = @landing
                    .signup_and_freetrial_login()
                    .login_user(@username, @password)
                    .go_to_my_profile()
                    .change_city_name(city)
                    .change_region(region)
                    .save_new_user_info_button()
    @browser.refresh
    city_reg, page = profile.get_data_from_form(3)
    expect(city_reg[:city]).to eql(city)
    expect(city_reg[:region]).to eql(region)
  end
  it 'change postal code and country' do
    postal_code = 11111111
    profile = @landing
                    .signup_and_freetrial_login()
                    .login_user(@username, @password)
                    .go_to_my_profile()
                    .change_postal_code(postal_code)
                    .select_new_country(1)
                    .save_new_user_info_button()
    @browser.refresh
    code, page = profile.get_data_from_form(4)
    expect(code).to eql(postal_code)
  end
end
