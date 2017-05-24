require_relative '../landing-page/plan'
require_relative '../landing-page/pricing'

module MyWebsites
  #my websites selectors
  @top_panel_buy_growth_plan_button                       = 'button.btn.btn_green.trial-notice__btn' 
  @message_modal_buy_growth_plan_button                   = 'button.btn.btn_green.bold.btn_width_md.btn_font_md'
  @message_modal_view_pricing                             = 'button.btn.btn_flat.btn_flat_blue.btn_width_md.btn_font_md'
  #initialize webdriver
  def self.initDriver(driver)
    puts '2'
    @browser = driver
    return self
  end

  def self.go_to_buy_growth_plan_top
    @browser.element(css: @top_panel_buy_growth_plan_button).fire_event 'click'
    return Plan.initDriver @browser
  end

  def self.go_to_buy_growth_plan_modal
    puts '3'
    @browser.element(css: @message_modal_buy_growth_plan_button).fire_event 'click'
    return Plan.initDriver @browser
  end
  
  def self.go_to_view_pricing_modal
    @browser.element(css: @message_modal_view_pricing).fire_event 'click'
    return Pricing.initDriver @browser
  end
end