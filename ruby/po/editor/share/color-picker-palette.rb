module ColorPickerPalette
  def self.initialize_palette(browser)
    @browser = browser
    @color_picker_pointer = '.pointer_35h'
    @color_input = '[data-test="color-input"]'
    @palette_item = '[data-test="color-item-palette"]'
    @alpha_input = '[data-test="input-number-input"]'
  end


  def self.input_color_palette(color)
    @browser.element(css: @color_input).send_keys color
  end

  def self.input_alpha_palette(percent)
    @browser.element(css: @alpha_input).send_keys percent
  end

  def self.change_alpha_slider_palette(x)
    @browser.element(css: @color_picker_pointer).fire_event "mouseover"  
    @browser.element(css: @color_picker_pointer).drag_and_drop_by x, 0
  end

  def self.click_palette_color_palette(index)
    @browser.elements(css: @palette_item)[index].fire_event 'click'
  end
end
