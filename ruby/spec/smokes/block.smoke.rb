require_relative '../../scripts/index.rb'

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
  it 'background color' do
    @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('color')
    @browser.send_keys :escape
    
    expect(@block.get_block_background.include?('rgb(255, 255, 255)')).to eql(true)
    expect(@block.get_block_background.include?('linear-gradient')).to eql(false)
  end
  it 'background gradient' do
    @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('gradient')
    @browser.send_keys :escape

    expect(@block.get_block_background.include?('linear-gradient')).to eql(true)
  end
  it 'background image' do
     @block.click_block_context('settings')
          .choose_tab('background')
          .change_background_type('image')
          .open_gallery()
          .select_tab("free photos")
          .choose_background_image(1)
    @browser.send_keys :escape

    puts @block.get_block_background 
  end
end
