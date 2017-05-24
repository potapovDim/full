require_relative "color-picker"
require_relative "media-gallery"

module BackgroundTab
  include ColorPicker
  include MediaGallery
  #css selectors initial
  @draggable_header         = '[data-test="win-setting-header"]'
  @settings_body            = '[data-test="window-settings-content"]'
  #current background
  @current_background_image = '[data-test="settings-upload-photo"]'
  #Open drop down controls
  @drop_list_control        = '.Select-control'
  #Drop down options   
  @drop_list_options        = '.Select-option'
  #if original image toggle repeat background
  @repeat_background        = '#background-repeat'
  #open color picker 
  @color_picker             = '[data-test="color-picker-input"]'
  #open media 
  @meddia_gallery_button    = '[data-test="settings-upload-photo"] button'
  #initialize driver
  @browser
  def self.initBrowser(browser)
    @browser = browser
    return self
  end
  #methods
  #shared methods
  #change change background type
  def self.change_background_type(background = "none")
    drop_list =  @browser.elements(css: @drop_list_control)
    drop_options = @browser.elements(css: @drop_list_options)
    case background
      when "none"
        drop_list[0].fire_event "mousedown"
        drop_options[0].fire_event "mousedown"
      when "image"
        drop_list[0].fire_event "mousedown"
        drop_options[1].fire_event "mousedown"
      when "video"
        drop_list[0].fire_event "mousedown"
        drop_options[2].fire_event "mousedown"
      when "color"
        drop_list[0].fire_event "mousedown"
        drop_options[3].fire_event "mousedown"    
      when "gradient"
        drop_list[0].fire_event "mousedown"
        drop_options[4].fire_event "mousedown"    
    end
    return self
  end
  #open color picker 
  def self.open_color_picker (number = 0)
    @browser.elements(css: @color_picker)[number].click
    return ColorPicker.initBrowser @browser
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
  def self.change_background_position(position="top left") #change image position on block background
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
  #current background image
  def self.get_current_backgroud_image
    return @browser.element(css: @current_background_image).attribute_value('style')
  end
  #media gallery
  def self.open_gallery
    @browser.element(css: @meddia_gallery_button).click
    return MediaGallery.initBrowser @browser
  end
  #need presets library add
end
