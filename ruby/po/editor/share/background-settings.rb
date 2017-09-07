class BackgroundSettings
  def initialize(browser)
    @browser = browser
    #css selectors initial
    @draggable_header             = '[data-test="win-setting-header"]'
    @settings_body                = '[data-test="window-settings-content"]'
    #current background
    @current_background_image     = '[data-test="settings-upload-photo"]'
    @repeat_background_checkbox   = 'label[for="background-repeat"]'
    #open color picker 
    @color_picker                 = '[data-test="color-picker-input"]'
    #open media 
    @meddia_gallery_button        = '[data-test="settings-upload-photo"] button'
  end
  #methods
  #shared methods
  #change change background type
  def change_background_type(background = "none")
    drop_list =  @browser.elements(css: @drop_list_control)
    drop_options = @browser.elements(css: @drop_list_options)
    case background
      when "none"
        drop_list[0].fire_event "mousedown"
        drop_options[0].fire_event "mousedown"
      when "image"
        drop_list[0].fire_event "mousedown"
        drop_options[1].fire_event "mousedown"
      when "color"
        drop_list[0].fire_event "mousedown"
        drop_options[2].fire_event "mousedown"
      when "gradient"
        drop_list[0].fire_event "mousedown"
        drop_options[3].fire_event "mousedown"
    end
    return self
  end
  #open color picker 
  def open_color_picker (number = 0)
    @browser.elements(css: @color_picker)[number].click
    return ColorPicker.new @browser
  end
  #image part methods
  #change background size : contain - cover - original
  def self.change_background_size(size="contain")
    drop_list =  @browser.elements(css: @drop_list_control)
    drop_options = @browser.elements(css: @drop_list_options)
    case size
      when "contain"
        drop_list[1].fire_event "mousedown"
        drop_options[0].fire_event "mousedown"
      when "cover"
        drop_list[1].fire_event "mousedown"
        drop_options[1].fire_event "mousedown"
      when "original"
        drop_list[1].fire_event "mousedown"
        drop_options[2].fire_event "mousedown"
    end
    return self
  end
  def change_background_position(position="top left") #change image position on block background
    drop_list =  @browser.elements(css: @drop_list_control)
    drop_options = @browser.elements(css: @drop_list_options)
    case position
      when "top left"
        drop_list[2].fire_event "mousedown"
        drop_options[0].fire_event "mousedown"
      when "top right"
        drop_list[2].fire_event "mousedown"
        drop_options[1].fire_event "mousedown"
      when "top center"
        drop_list[2].fire_event "mousedown"
        drop_options[2].fire_event "mousedown"
      when "center left"
        drop_list[2].fire_event "mousedown"
        drop_options[3].fire_event "mousedown"
      when "center right"
        drop_list[2].fire_event "mousedown"
        drop_options[4].fire_event "mousedown"
      when "center center"
        drop_list[2].fire_event "mousedown"
        drop_options[5].fire_event "mousedown"
      when "bottom center"
        drop_list[2].fire_event "mousedown"
        drop_options[6].fire_event "mousedown"
      when "bottom right"
        drop_list[2].fire_event "mousedown"
        drop_options[7].fire_event "mousedown"
      when "bottom left"
        drop_list[2].fire_event "mousedown"
        drop_options[8].fire_event "mousedown"
    end
    return self
  end
end
