module FontType
  #css selectors
  @item = '[data-test="drop-down-item"]'
  #initialize browser
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end

  def self.choose_font_type(font_type="thin")
    font_types = @browser.elements(css: @item)
    case font_type
      when "thin"
        font_types[0].click 
      when "ultralight"
        font_types[1].click 
      when "light"
        font_types[2].click 
      when "regular"
        font_types[3].click 
      when "medium"
        font_types[4].click 
      when "bold"
        font_types[5].click 
      when "black"
        font_types[6].click 
    end
    return self
  end
  #api method
end