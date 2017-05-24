require_relative '../landing-page/plan'
require_relative '../landing-page/pricing'

module EditorExpiredPerion
  #expired period selectors 
  @buy_a_growth_plan_top_link                   = 'a[title="Buy a Growth Plan"]'
  @view_pricing_button                          = 'button[title="View pricing"]'
  @buy_a_growth_plan_modal_button               = 'button[title="Buy a Growth Plan"]'
  #initialize webdriver 
  def self.initDriver(driver)
    @browser = driver
    return self
  end
  #click publish button for open modal
  def self.publish_button_click
    @browser.element(text: 'Publish').fire_event 'click'
    return self
  end
  #go to buying plan for current website (top black link)
  def self.buy_a_growth_plan_for_current_website
    @browser.element(css: @buy_a_growth_plan_top_link).fire_event 'click'
    return Plan.initDriver(@browser)
  end
  #go to buying plan for current website (from opened modal)
  def self.buy_a_growth_plan_for_current_website_modal
    @browser.element(css: @buy_a_growth_plan_modal_button).fire_event 'click'
    return Plan.initDriver(@browser)
  end
  #go to pricing
  def self.go_to_view_pricing
    @browser.element(css: @view_pricing_button).fire_event 'click'
    return Pricing.initDriver(@browser)
  end
  
 
end