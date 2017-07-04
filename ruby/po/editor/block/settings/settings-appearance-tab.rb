#block settings appearance tab
module AppearanceTab
  #css selectors
  @block_to_full_height = 'input#cb-full-screen'
  @full_width_bg_center_ctnt = 'input#background'
  @full_width_bg_full_width_ctnt = 'input#content'
  @none_bg_none_ctnt = 'input#none'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #methods
  def self.change_block_appearance(type="none")
    case type
      when "none"
        @browser.element(css: @none_bg_none_ctnt).fire_event "change"
      when "full-full"
        @browser.element(css: @full_width_bg_full_width_ctnt).fire_event "change"
      when "full-center"
        @browser.element(css: @full_width_bg_center_ctnt).fire_event "change"
    end
    return self
  end
end