# require_relative '../../scripts/local.rb'

# describe 'Navigation' do
#   before :each do
#     @browser.window.resize_to 1200, 1600
#     @browser.goto @base_url
#   end
#   it 'change user first name' do
#     new_user_name = 'test'
#   end
#   it 'change user last name' do
#     new_user_lastname = 'test'
#     user_name, myProfile = @landing
#                     .signup_and_freetrial_login()
#                     .login_user(@username, @password)
#                     .go_to_my_profile()
#                     .change_last_name(new_user_lastname)
#                     .save_new_user_info_button()
#                     .get_user_name_last_name()
#     expect(user_name.include? new_user_lastname).to eql(true)
#   end
#   it 'change user full name' do
#     new_user_firstname = 'test_fir'
#     new_user_lastname = 'test_last'
#     user_name, myProfile = @landing
#                     .signup_and_freetrial_login()
#                     .login_user(@username, @password)
#                     .go_to_my_profile()
#                     .change_last_name(new_user_lastname)
#                     .change_first_name(new_user_firstname)
#                     .save_new_user_info_button()
#                     .get_user_name_last_name()
#     expect(user_name.include? new_user_firstname).to eql(true)
#     expect(user_name.include? new_user_lastname).to eql(true)
#   end

# end