require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Publish website" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end
  it "positive publish website" do
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(2)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    publish_result = @editor.publish_website()
    expect(publish_result).to eql(true)
    sleep 5
    editor.publish_website
  end
end
