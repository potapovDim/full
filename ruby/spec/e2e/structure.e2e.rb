require_relative '../../scripts/index.rb'

# , :focus => true if need run only this suit
describe 'Row' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url    
    set_token(@browser,@username,@password)
    @browser.goto @base_url + 'editor/website/' + get_first_user_website_id(@username, @password)
    @row = Row.new(@browser, 0)
    LeftNav.new(@browser).present()
    @row_settings = @row.hover_current_row
        .click_row_context("settings")
 #   @browser.send_keys :escape
  end

  it 'row background (color)' do 
    initial_background = @row.get_row_background
    color_tab = @row_settings.choose_tab("background")
                .swich_tab("Color")
                
    color_tab.clear_color_input()
             .color_element.send_keys("#AAAAAA")
#check color input
    expect(@row.get_row_background).to_not eql(initial_background)
    expect(@row.get_row_background.include?("rgb(170, 170, 170)")).to eql(true)
#set opacity using dnd to 65
    color_tab.drag_opacity_picker(-30,0)
    sleep 0.2
    expect(@row.get_row_background.include?("rgba(170, 170, 170, 0.65)")).to eql(true)
    expect(color_tab.opacity_element.value).to eql("65")
#set opacity using dnd to 100
    color_tab.drag_opacity_picker(31,0)
    sleep 0.2
    expect(@row.get_row_background.include?("rgb(170, 170, 170)")).to eql(true)
    expect(color_tab.opacity_element.value).to eql("100")
#alpha input check
    color_tab.clear_opacity_input
             .opacity_element.send_keys(33)
    sleep 0.2    
    expect(@row.get_row_background.include?("rgba(170, 170, 170, 0.33)")).to eql(true)
#set color by color picker 
#check is opacity saved
    color_tab.click_palette_color(15)
    sleep 0.2            
    expect(@row.get_row_background.include?('rgba(255, 202, 40, 0.33)')).to eql(true)
    expect(color_tab.color_element.value).to eql("#FFCA28")
    expect(color_tab.is_color_active?(15)).to eql(true)
#check reset function
    color_tab.reset
    sleep 0.2   
    expect(@row.get_row_background).to eql(initial_background)    
    expect(color_tab.color_element.value).to eql("#FFFFFF")
    expect(color_tab.opacity_element.value).to eql("100")
    end
#   it 'row background (gradient)' do
#     initial_background = @row.get_row_background
#     @row.click_row_context('settings')
#         .choose_tab("background")
#         .change_background_type("gradient")
#     @browser.send_keys :escape
#     changed_background = @row.get_row_background
#     expect(changed_background).to_not eql(initial_background)
#   end
  fit 'row background (image)' do
    initial_background = @row.get_row_background
    image_tab = @row_settings.choose_tab("background")
                .swich_tab("Image")
                .reset()
         
    image_tab.open_media_gallery()
             .choose_image()
             .change_image()
    expect(@row.get_row_background).to include("url(")
    background_tab = image_tab.open_background_settings
                              .change_cover_settings("contain")
    expect(@row.get_row_background).to include("contain")
    background_tab.change_cover_settings("cover")
    expect(@row.get_row_background).to include("cover") 
    background_tab.change_cover_settings("auto")
    expect(@row.get_row_background).to include("auto") 
    background_tab.change_background_position("Bottom right")
    expect(@row.get_row_style).to include("right bottom")    
    background_tab.change_background_position("Middle center")
    expect(@row.get_row_style).to include("center center")
    background_tab.change_background_position("Top left")
    expect(@row.get_row_style).to include("left top")  
    background_tab.repeat_image()
    expect(@row.get_row_background).to_not include("no-repeat")
    expect(@row.get_row_background).to include("repeat")
    background_tab.repeat_image()
    expect(@row.get_row_background).to include("no-repeat")
    background_tab.set_background_color("#000000")
    expect(@row.get_row_background).to include("rgb(0, 0, 0)")
    background_tab.open_color_picker()
              .drag_opacity_picker(-30,0)
              .click_palette_color(10)
              .go_back()
    expect(@row.get_row_style).to include("rgba(255, 111, 0, 0.79)","left top","auto","url(")
    image_tab.clear_background_settings()
    expect(@row.get_row_style).to include("rgb(255, 255, 255)",'center center','cover','url(')
    image_tab.clear_image()
    expect(@row.get_row_style).to_not include("rgb(255, 255, 255)",'center center','cover')
    
    # expect(@row.get_block_background).to_not include("rgba(255, 111, 0, 0.79)")
    
 
    
  end
  it 'row layout' do
    layout_tab = LayoutTab.new(@browser)
    layout_tab.change_layout(4)
    changed_row_layout = @row.get_row_layout 
#switch to 4 layout
    expect(changed_row_layout).to eql(4)
    expect(layout_tab.custom_width_presented?).to eql(true)
#switch to first layout
    layout_tab.change_layout(1)
    expect(@row.get_row_layout).to eql(1)
#switch to 5th layout
    layout_tab.change_layout(5)
    expect(layout_tab.layout_active?(5)).to eql(true)
    expect(@row.get_row_layout).to eql(6)
#drag last sosochek to the right
    expect(layout_tab.get_layout_postion(5)).to eql("10")
    layout_tab.create_custom_layout(20,0,5)    
    expect(layout_tab.get_layout_postion(5)).to eql("11")
    expect(layout_tab.layout_active?(5)).to eql(false)
#drag last sosochek to the left
    layout_tab.create_custom_layout(-20,0,5)
    expect(layout_tab.get_layout_postion(5)).to eql("10")
    expect(layout_tab.layout_active?(5)).to eql(true)
#check no-intend-functionality
    margin_before = @row.intend_between_columns?
    layout_tab.nomargin_click
    expect(@row.intend_between_columns?).to_not eql(margin_before)
    layout_tab.nomargin_click
    expect(@row.intend_between_columns?).to eql(margin_before)  
  end
end
# , :focus => true if need run only this suit
# describe 'Block component' do
#   before :each do
#     @browser.window.resize_to  1600, 1200
#     @browser.goto @base_url
#     @landing.login()
#             .success_login_user(@username, @password) 
#             .go_to_my_websites()
#             .go_to_editor_from_website(0)
#     expect(@browser.url.include?('/editor/website/')).to eql(true)
#     @block = Block.new(@browser, 0)
#     @block.click_block_context('settings')
#           .choose_tab('background')
#           .change_background_type('none')
#     @browser.send_keys :escape

#     expect(@block.get_block_background.include?('none')).to eql(true)
#     expect(@block.get_block_background.include?('linear-gradient')).to eql(false)
#   end
#   it 'background settings part (color, gradient, image)' do
#     @block.click_block_context('settings')
#           .choose_tab('background')
#           .change_background_type('color')
#     @browser.send_keys :escape
    
#     expect(@block.get_block_background.include?('rgb')).to eql(true)
#     expect(@block.get_block_background.include?('255, 255, 255')).to eql(true)
#     expect(@block.get_block_background.include?('linear-gradient')).to eql(false)

#     @block.click_block_context('settings')
#           .choose_tab('background')
#           .change_background_type('gradient')
#     @browser.send_keys :escape

#     expect(@block.get_block_background.include?('linear-gradient')).to eql(true)

#     @block.click_block_context('settings')
#           .choose_tab('background')
#           .change_background_type('image')
#           .open_gallery()
#           .select_tab("free photos")
#           .choose_background_image(1)
#     @browser.send_keys :escape

#     expect(@block
#         .get_block_background.include?('url("https://weblium-stage.storage.googleapis.com')).to eql(true) 
#   end
# end
