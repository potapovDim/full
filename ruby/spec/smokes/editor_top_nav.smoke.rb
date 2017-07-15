require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Editor top nav" do
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
    editor_mode = @editor.get_top_nav_instance
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
  it "present open website button exists" do
    button, top_nav = @editor.get_top_nav_instance()
                             .open_website_button(true)
    expect(button).to eql(true)
  end
  it "new tab tests" do
    new_tab = @editor.get_top_nav_instance().open_new_tab()
    before_move, after_move, new_tab = new_tab.change_window_position(30 ,40)
    expect(before_move).to_not eql after_move
    new_tab.open_page(1)
  end
  # it "present open website button not exists" do
  #   @landing.login()
  #           .login_user(@username, @password) 
  #           .go_to_my_websites()
  #           .go_to_editor_from_website(1)
  #   top_nav, button = @editor.get_top_nav_instance()
  #                            .open_website_button(false)
  #   expect(button).to eql(false)
  # end
end
