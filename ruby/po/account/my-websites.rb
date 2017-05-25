require_relative '../landing-page/plan'
require_relative '../landing-page/pricing'

module MyWebsites
  #my websites selectors
  @top_panel_buy_growth_plan_button                       = 'button.btn.btn_green.trial-notice__btn' 
  @message_modal_buy_growth_plan_button                   = 'button.btn.btn_green.bold.btn_width_md.btn_font_md'
  @message_modal_view_pricing                             = 'button.btn.btn_flat.btn_flat_blue.btn_width_md.btn_font_md'
  @website_edit_button                                    = 'button.btn.btn_white.btn_upper.btn_width_sd' # go to editor
  #initialize webdriver
  def self.initDriver(driver)
    @browser = driver
    return self
  end

  def self.go_to_buy_growth_plan_top
    @browser.element(css: @top_panel_buy_growth_plan_button).fire_event 'click'
    return Plan.initDriver @browser
  end

  def self.go_to_buy_growth_plan_modal
    @browser.element(css: @message_modal_buy_growth_plan_button).fire_event 'click'
    return Plan.initDriver @browser
  end
  
  def self.go_to_view_pricing_modal
    @browser.element(css: @message_modal_view_pricing).fire_event 'click'
    return Pricing.initDriver @browser
  end

  def self.go_to_editor_from_website(website)
    user_websites = @browser.elements(css: @website_edit_button)
    if user_websites.length == 1
      @browser.elements(css: @website_edit_button)[0].fire_event 'hover'
      @browser.elements(css: @website_edit_button)[0].fire_event 'click'
    else 
      @browser.elements(css: @website_edit_button)[website].fire_event 'hover'
      @browser.elements(css: @website_edit_button)[website].fire_event 'click'
    end
  end
end