class MyWebsites
  #my websites selectors
  
  #initialize webdriver
  def initialize(driver)
    @browser = driver
    @top_panel_buy_growth_plan_button                       = '.btn.btn_green.trial-notice__btn' 
    @message_modal_buy_growth_plan_button                   = '.btn.btn_green.bold.btn_width_md.btn_font_md'
    @message_modal_view_pricing                             = '.btn.btn_flat.btn_flat_blue.btn_width_md.btn_font_md'
    @website_edit_button                                    = '.btn.btn_white.btn_upper.btn_width_sd' # go to editor
    @website_settings_button                                = '.button.btn.btn_flat.btn_flat_white.btn_upper.btn_width_sd' #for open website settings
    @create_new_website_green_plus                          = '[data-test="simple-button"]'
  end
  def add_new_website
    @browser.element(css: @create_new_website_green_plus).fire_event 'click'
    return Concepts.new @browser
  end
  def go_to_buy_growth_plan_top
    @browser.element(css: @top_panel_buy_growth_plan_button).fire_event 'click'
    return Plan.new @browser
  end

  def go_to_buy_growth_plan_modal
    @browser.element(css: @message_modal_buy_growth_plan_button).fire_event 'click'
    return Plan.new @browser
  end
  
  def go_to_view_pricing_modal
    @browser.element(css: @message_modal_view_pricing).fire_event 'click'
    return Pricing.new @browser
  end

  def go_to_editor_from_website(website)
    user_websites = @browser.elements(css: @website_edit_button)
    if user_websites.length <= website
      @browser.elements(css: @website_edit_button)[0].fire_event 'hover'
      @browser.elements(css: @website_edit_button)[0].fire_event 'click'
    else 
      @browser.elements(css: @website_edit_button)[website].fire_event 'hover'
      @browser.elements(css: @website_edit_button)[website].fire_event 'click'
    end
  end

  def open_website_settings(website)
    @browser.elements(css: @website_settings_button)[website].fire_event 'hover'
    @browser.elements(css: @website_settings_button)[website].fire_event 'click'
  end
end