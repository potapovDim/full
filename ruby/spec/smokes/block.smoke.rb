require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Block component", do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(2)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
  end
  it "change block background" do
    @block = Block.new(@browser, 0)
    initial_background = @block.get_block_background
    @block.click_block_context('settings')
          .choose_tab("background")
          .change_background_type("color")
    @browser.send_keys :escape
    changed_background = @block.get_block_background
    expect(changed_background).to_not eql(initial_background)
  end
end
