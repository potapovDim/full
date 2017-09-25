#color picker 
class ColorPicker
  #css selectors
  def initialize(browser)
    @browser = browser
    @color_picker_pointer = '.pointer_35h'
    @alpha_input = '[data-test="input-number-input"]'
    @saturation = '[data-test="color-picker-saturation"]>div'
    @hue_vertical = '.hue-vertical'
  end

  def change_color_saturation(x, y, place) #change color
    case place
      when "hue"  
        @browser.element(css: @hue_vertical).drag_and_drop_by x, y
      when "saturation"
        @browser.element(css: @saturation).drag_and_drop_by x, y
    end
    return self
  end

  def change_alpha_slider_saturation(x)
    @browser.element(css: @color_picker_pointer).fire_event "mouseover"  
    @browser.element(css: @color_picker_pointer).drag_and_drop_by x, 0
  end

  def input_alpha_palette(percent)
    @browser.element(css: @alpha_input).send_keys percent
  end
end
