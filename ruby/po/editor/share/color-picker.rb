#color picker 
module ColorPicker
  #css selectors
  #change color type
  @hue = '[data-test="color-picker-hue"]' #hue line
  @alpha = '[data-test="color-picker-alpha"]' #alpha chanel line
  @saturation = '[data-test="color-picker-saturation"]>div' #saturation area
  #change tab : rgba - hex - hsb
  #TAB HEX 
  @hex_tab = '[data-test="flex-wrapper"]>button:nth-child(1)'
  #input value
  @hex_value_input = '#hex-tab input'
  #TAB RGB
  @rgb_tab = '[data-test="flex-wrapper"]>button:nth-child(2)'
  #inputs
  @r_value_input = '#rcolor'
  @g_value_input = '#gcolor'
  @b_value_input = '#bcolor'
  @a_value_input = '#acolor'
  #TAB HSB
  @hsb_tab = '[data-test="flex-wrapper"]>button:nth-child(3)'
  #inputs
  @h_value_input = '#rcolor'
  @s_value_input = '#scolor'
  @bb_value_input = '#bbcolor'
  #initialize driver
  @browser
  def self.initBrowser(browser)
    @browser = browser
    return self
  end
  #methods
  #change color 
  def self.change_color (x, y, place="alpha") #change color
    case place
      when "alpha"
        @browser.element(css: @alpha).drag_and_drop_by x, y
      when "hue"  
        @browser.element(css: @hue).drag_and_drop_by x, y
      when "saturation"
        @browser.element(css: @saturation).drag_and_drop_by x, y
    end
    return self
  end
  #change value in tabs
  def self.change_tab_and_value (tab="hex", *values) #change color by tabs input
    case tab
      when "hex"
        @browser.element(css: @hex_tab).click
        @browser.element(css: @hex_value_input).send_keys values[0]
      when  "rgb"
        @browser.element(css: @rgb_tab).click
        @browser.element(css: @r_value_input).send_keys values[0]
        @browser.element(css: @g_value_input).send_keys values[1]
        @browser.element(css: @b_value_input).send_keys values[2]
        @browser.element(css: @a_value_input).send_keys values[3]
      when "hsb"  
        @browser.element(css: @rgb_tab).click
        @browser.element(css: @h_value_input).send_keys values[0]
        @browser.element(css: @s_value_input).send_keys values[1]
        @browser.element(css: @bb_value_input).send_keys values[2]
    end
    return self
  end
  #close color picker
  def self.close_color_picker
    @browser.elements(css: '[data-test="win-setting-header"]>button')[1].click
  end
end
