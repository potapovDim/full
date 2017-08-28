require_relative '../../scripts/index.rb'

# , :focus => true if need run only this suit
describe 'Row' do
  before :each do
    @browser.window.resize_to 1600, 1200 
    @browser.goto @base_url
    @landing.login()
            .success_login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(0)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @row = Row.new(@browser, 0)
    @row.hover_current_row
    @row.click_row_context('settings')
        .choose_tab("background")
        .change_background_type("none")
    @browser.send_keys :escape
  end
  it 'row background (color)' do
    initial_background = @row.get_row_background
    @row.click_row_context('settings')
        .choose_tab("background")
        .change_background_type("color")
    @browser.send_keys :escape
    changed_background = @row.get_row_background
    expect(changed_background).to_not eql(initial_background)
  end
  it 'row background (gradient)' do
    initial_background = @row.get_row_background
    @row.click_row_context('settings')
        .choose_tab("background")
        .change_background_type("gradient")
    @browser.send_keys :escape
    changed_background = @row.get_row_background
    expect(changed_background).to_not eql(initial_background)
  end
  it 'row layout' do
    initial_layout = @row.get_row_layout
    @row.click_row_context("settings")
        .choose_tab("layout")
        .change_layout(2)
        .change_layout(3)
        .change_layout(4)
        .change_layout(5)
    @browser.send_keys :escape
    changed_row_layout = @row.get_row_layout
    #expect(initial_layout).to_not eql(changed_row_layout)
  end
end

# , :focus => true if need run only this suit
describe 'Block component' do
  before :each do
    @browser.window.resize_to  1600, 1200
    @browser.goto @base_url
    @landing.login()
            .success_login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(0)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @block = Block.new(@browser, 0)
    @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('none')
    @browser.send_keys :escape

    expect(@block.get_block_background.include?('none')).to eql(true)
    expect(@block.get_block_background.include?('linear-gradient')).to eql(false)
  end
  it 'background settings part (color, gradient, image)' do
    @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('color')
    @browser.send_keys :escape
    
    expect(@block.get_block_background.include?('rgb')).to eql(true)
    expect(@block.get_block_background.include?('255, 255, 255')).to eql(true)
    expect(@block.get_block_background.include?('linear-gradient')).to eql(false)

    @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('gradient')
    @browser.send_keys :escape

    expect(@block.get_block_background.include?('linear-gradient')).to eql(true)

    @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('image')
          .open_gallery()
          .select_tab("free photos")
          .choose_background_image(1)
    @browser.send_keys :escape

    expect(@block
        .get_block_background.include?('url("https://weblium-stage.storage.googleapis.com')).to eql(true) 
  end
end
