require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Editor mode" do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(0)
  end
  it "change editor mode" do
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    editor_mode = @editor.editor_mode_change
    editor_mode.preview_mode_submit
    expect(@browser.url.include?('/editor/preview/')).to eql(true)
    editor_mode.editor_mode_submit
    expect(@browser.url.include?('/editor/preview/')).to eql(false)
    editor_mode.mobile_mode_submit
    expect(@browser.url.include?('/mobile/')).to eql(true)
    editor_mode.desktop_mode_submit
    expect(@browser.url.include?('/mobile/')).to eql(false)
  end
  it "publish website (first open and close window, after publish)" do 
    #assert than we are in editor
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    #open publish modal window and close it
    @editor.open_publis_window_and_close()
    #positive publish website
    publish_result = @editor.publish_website()
    expect(publish_result).to eql(true)
  end
end
