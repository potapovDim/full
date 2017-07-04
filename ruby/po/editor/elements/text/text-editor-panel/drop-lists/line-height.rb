module LineHeight
  #css selectors
  @item = '[data-test="drop-down-item"]'
  #initialize browser
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end

  def self.choose_line_height(line_height=8)
    line_heights = @browser.elements(css: @item)
    case font_type
      when 8
        font_types[0].click 
      when 9
        font_types[1].click 
      when 10
        font_types[2].click 
      when 11
        font_types[3].click 
      when 12
        font_types[4].click 
      when 13
        font_types[5].click 
      when 14
        font_types[6].click 
      when 16
        font_types[7].click 
      when 18
        font_types[8].click 
      when 20
        font_types[9].click 
      when 24
        font_types[10].click 
      when 29
        font_types[11].click 
      when 32
        font_types[6].click 
      when 36
        font_types[6].click 
      when 43
        font_types[6].click 
      when 14
        font_types[6].click 
      when 14
        font_types[6].click 
    end
    return self
  end
  #api method
end
# 24
# 29
# 32
# 36
# 43
# 48
# 52
# 64
# 67
# 72