require_relative '../../scripts/local.rb'
require_relative '../../helpers/index'

# , :focus => true if need run only this suit
describe "Website myaccount" do
  before :each do
    clear_useless_user_websites(@username_remove, @password_remove)
    @browser.window.resize_to 1600, 1200 
    @browser.goto @base_url
    @my_account_websites = @landing.login()
                          .login_user(@username_remove, @password_remove)
                          .go_to_my_websites()
  end
  it "try to add more then 10 websites" do
     concepts_lists = @my_account_websites.add_new_website
     editor_top_nav = @editor.get_top_nav_instance

     concepts_lists.choose_concept(0)
     expect(@browser.url.include?('/editor/website/')).to eql(true)

  end
end
