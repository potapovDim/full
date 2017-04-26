require_relative '../../scripts/local.rb'

describe 'Change user profile' do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end

  it 'change user name' do
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
end
