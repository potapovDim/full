require_relative '../../scripts/index.rb'
require_relative '../../helpers/index'

# , :focus => true if need run only this suit
describe 'Websites myaccount' do
  before :each do
    clear_useless_user_websites(@username_remove, @password_remove, false, true)
    @browser.window.resize_to 1600, 1200 
    @browser.goto @base_url
    @my_account_websites = @landing.login()
                          .success_login_user(@username_remove, @password_remove)
                          .go_to_my_websites()
  end
  it 'try to add more then 10 websites' do
    @my_account_websites.add_new_website.choose_concept(0)
    expect(@browser.url.lude?('myaccount/website/create')).to eql(true)
    editor_top_nav = @editor.get_top_nav_instance

    @browser.wait_until(timeout: 150) { |browser| browser.url.include?('/editor/website/')}

    editor_top_nav.right_drop_menu_navigate_to('websites')
    @my_account_websites.add_new_website
    expect(@browser.url.include?('/editor/website/')).to eql(false)
  end
  it 'remove website from website settings' do
     
  end
end