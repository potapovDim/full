class Fonts
  def initialize (browser)
    @browser = browser
    #css selectors
    @search_input = 'input[placeholder="Search font"]'
    @prev_font = '[data-test="prev-font"]'
    @next_font = '[data-test="next-font"]'
    @font = '[data-test="font-family-item"]'
  end

  #api method
  def prev_font_button
    @browser.element(css: @prev_font).click
    return self
  end

  def next_font_button
    @browser.element(css: @next_font).click
    return self
  end

  def choose_some_font(font_index=0)
    fonts = @browser.elements(css: @font)
    fonts[font_index].click
    return self
  end

  def search_some_font(font_name)
    @browser.element(css: @search_input).clear
    @browser.element(css: @search_input).send_keys font_name
    return self
  end

  def close_font_modal
    @browser.send_keys :escape
  end
end
