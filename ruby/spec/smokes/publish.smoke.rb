require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Publish website" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end
  it "publish website (first open and close window, after publish)" do
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(0)
    #assert than we are in editor
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    #open publish modal window and close it
    @editor.open_publis_window_and_close()
    #positive publish website
    publish_result = @editor.publish_website()
    expect(publish_result).to eql(true)
    sleep 5
    editor.publish_website
  end
end
