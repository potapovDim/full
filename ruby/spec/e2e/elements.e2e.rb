require_relative '../../scripts/index.rb'

describe 'Components (app, general elements context-panel)' do
    describe 'Components' do
        before :each do
          @browser.window.resize_to  1600, 1200
          @browser.goto @base_url
          @landing.login()
                  .success_login_user(@username, @password) 
                  .go_to_my_websites()
                  .go_to_editor_from_website(0)
          sleep 1
          expect(@browser.url.include?('/editor/website/')).to eql(true)
          @icon = Icon.new @browser
          @image = Image.new @browser
          @line = Line.new @browser
          @text = Text.new @browser
          @button = Button.new @browser
        end
        it 'change elements align' do
          @button.focus_element
          sleep 1
          @button.context_panel_action("align center")
              .click_context_item("align left")
              .click_context_item("align right")
              .click_context_item("align left")
              .click_context_item("align center")
      
          @icon.focus_element
          sleep 1
          @icon.context_panel_action("align center")
              .click_context_item("align left")
              .click_context_item("align right")
              .click_context_item("align left")
              .click_context_item("align center")
      
          @image.focus_element
          sleep 1
          @image.context_panel_action("align center")
              .click_context_item("align left")
              .click_context_item("align right")
              .click_context_item("align left")
              .click_context_item("align center")
          
          @button.focus_element
          sleep 1
          @button.context_panel_action("align center")
              .click_context_item("align left")
              .click_context_item("align right")
              .click_context_item("align left")
              .click_context_item("align center")
      
          @text.focus_element
          sleep 1
          @text.context_panel_action("align center")
              .click_context_item("align left")
              .click_context_item("align right")
              .click_context_item("align left")
              .click_context_item("align center")
      
          @line.focus_element
          sleep 1
          @line.context_panel_action("align center")
              .click_context_item("align left")
              .click_context_item("align right")
              .click_context_item("align left")
              .click_context_item("align center")
        end
      end
      
      # , :focus => true if need run only this suit
    describe 'Apps' do
        before :each do
          @browser.window.resize_to  1600, 1200
          @browser.goto @base_url
          @landing.login()
                  .success_login_user(@username, @password) 
                  .go_to_my_websites()
                  .go_to_editor_from_website(0)
          sleep 1
          expect(@browser.url.include?('/editor/website/')).to eql(true)
          @social_icons = SocialIcons.new @browser
          @image_gallery = ImageGallery.new @browser
          @map = Map.new @browser
          @menu = Menu.new @browser
          @slider = Slider.new @browser
        end
        it 'change apps align' do
          @social_icons.focus_element
          sleep 1
          @social_icons.context_panel_action('align center')
              .click_context_item('align left')
              .click_context_item('align right')
              .click_context_item('align left')
              .click_context_item('align center')
      
          @image_gallery.focus_element
          sleep 1
          @image_gallery.context_panel_action('align center')
              .click_context_item('align left')
              .click_context_item('align right')
              .click_context_item('align left')
              .click_context_item('align center')
      
          @map.focus_element
          sleep 1
          @map.context_panel_action('align center')
              .click_context_item('align left')
              .click_context_item('align right')
              .click_context_item('align left')
              .click_context_item('align center')
          
          @menu.focus_element
          sleep 1
          @menu.context_panel_action('align center')
              .click_context_item('align left')
              .click_context_item('align right')
              .click_context_item('align left')
              .click_context_item('align center')
          sleep 1
          @slider.focus_element
          @slider.context_panel_action('align center')
              .click_context_item('align left')
              .click_context_item('align right')
              .click_context_item('align left')
              .click_context_item('align center')
        end
      end
end
