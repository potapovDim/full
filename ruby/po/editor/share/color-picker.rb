class ColorPicker
  def initialize(browser)
    @browser = browser
    @opacity_picker_pointer = '.pointer_35hVk'
    @color_input = 'input[type="text"]'
    @palette_item = '[data-test="color-item-palette"]'
    @alpha_input = '[data-test="input-number-input"]'
  end
  def input_color_palette(color)
    @browser.element(css: @color_input).send_keys color
  end
  def clear_color_input()
    clear_input(@color_input)
    return self
  end
  def input_alpha_palette(percent)
    @browser.element(css: @alpha_input).send_keys percent
  end

  def change_alpha_slider_palette(x)
    @browser.element(css: @color_picker_pointer).fire_event "mouseover"  
    @browser.element(css: @color_picker_pointer).drag_and_drop_by x, 0
  end

  def click_palette_color(index)
    @browser.elements(css: @palette_item)[index].fire_event 'click'
  end
end
