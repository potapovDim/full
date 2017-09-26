class ColorPicker
  def initialize(browser)
    @browser = browser
    @opacity_picker_pointer = '.pointer_35hVk'
    @color_input            = 'input[type="text"]'
    @palette_item           = '[data-test="color-item-palette"]'
    @alpha_input            = '[data-test="input-number-input"]'
    @reset_button           = 'button[title="Reset"]'
    #input elements
    @color_element          = @browser.element(css: @color_input)
    @opacity_element        = @browser.element(css: @alpha_input)
  end
  attr_reader :color_element, :opacity_element
  
  # Do lytchih vremen
  # def self.my_attr_reader(var_name)
  #   define_method(var_name) do
  #     return @browser.element(css: instance_variable_get(("@#{var_name}")))
  #   end
  # end
  # my_attr_reader :color_input
  # my_attr_reader :alpha_input

  def drag_opacity_picker(x,y)
    dnd_element(@opacity_picker_pointer,x,y)
  end
  def clear_color_input()
    clear_input(@color_input)
    return self
  end
  def input_alpha_palette()
    clear_input(@alpha_input)
    return self
  end

  def click_palette_color(index)
    @browser.elements(css: @palette_item)[index].fire_event 'click'
  end
  def reset
    @browser.element(css: @reset_button).click
  end
end
