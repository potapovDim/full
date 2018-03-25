class BackgroundSettings
  def initialize(browser)
    @browser = browser
    #css selectors initial
    #cover settings
    @scale_image     =          'label[for="cover"]'
    @original_image  =          'label[for="auto"]'
    @contain_image   =          'label[for="contain"]'

    @repeat_image    =          'label[for="background-repeat"]'
    @open_color_picker =        '[data-test="open-color-palette"]'
    
  end
  #cover settings:
    #cover   - Scale image to cover all background
    #auto    - Use original image size.
    #contain - Contain all image in background.
  #
  def change_cover_settings(cover = "none")
    case cover
      when "cover"
        @browser.element(css: @scale_image).click
      when "auto"
        @browser.element(css: @original_image).click       
      when "contain"
        @browser.element(css: @contain_image).click
      end
    return self
  end
  def repeat_image 
    @browser.element(css: @repeat_image ).click
    return self
  end
  def set_background_color(color)
    color_picker = ColorPicker.new(@browser)
    color_picker.clear_color_input
                .color_element.send_keys(color)
    return self
  end
  #open color picker 
  def open_color_picker ()
    @browser.element(css: @open_color_picker).click
    return ColorPicker.new @browser
  end
  #position like on checkbox title
  def change_background_position(position="Top left") 
    @browser.element(css: "label[title='#{position}']").click
    return self
  end
end
