module EditorExpiredPerionAndPublish
  #selectors 
  @buy_a_growth_plan_top_link                   = 'a[title="Buy a Growth Plan"]'
  @view_pricing_button                          = 'button[title="View pricing"]'
  @buy_a_growth_plan_modal_button               = 'button[title="Buy a Growth Plan"]'
  @ready_to_launch_submit                       = 'button[title="Ready to launch!"]'
  @preview_or_edit_website                      = '[data-test="preview-or-edit"]'
  @mobile_view_mode                             = '[data-test="website-view-mobile"]'
  @desktop_view_mode                            = '[data-test="website-view-desktop"]'
  @open_publised_website                        = '[data-test="open-published-site"]'

  @mode_selectors                               = '.item_348Ou' #not stable will be changed to data-test
  #initialize webdriver 
  def self.initDriver(driver)
    @browser = driver
    return self
  end
  #click publish button for open modal
  def self.publish_button_click
    if @browser.button(css: '.button_1BgCo.button_blue_2aXIf').text == 'Published'
      #if site already published we change block`s` padding
      Block.new(@browser).resize_padding()
                         .resize_padding_bottom_block(10, -10, 1)
    elsif @browser.button(css: '.button_1BgCo.button_blue_2aXIf').text == 'Publishing'
       @browser.span(text: 'Publishing').fire_event 'click'
       return self 
    end
    @browser.button(css: '.button_1BgCo.button_blue_2aXIf').fire_event 'click'
    return self
  end
  #go to preview mode
  def self.preview_mode_submit
    @browser.element(css: @preview_or_edit_website).fire_event 'click'
    @browser.wait_until(timeout: 150) { |browser| browser.url.include?('/editor/preview/')}
    return self
  end
  #go to editor mode
  def self.editor_mode_submit
    @browser.element(css: @preview_or_edit_website).fire_event 'click'
    @browser.wait_until(timeout: 150) { |browser| browser.url.include?('/editor/preview/') == false}
    return self
  end
  #go to mobile mode
  def self.mobile_mode_submit
    @browser.element(css: @mobile_view_mode).fire_event 'click'
    @browser.wait_until(timeout: 150) { |browser| browser.url.include? 'mobile/'}
    return self
  end
  #go to desktop mode
  def self.desktop_mode_submit
    @browser.element(css: @desktop_mode_submit).fire_event 'click'
    @browser.wait_until(timeout: 150) { |browser| browser.url.include?('mobile/') == false}
    return self
  end
  #ready to lanunch! success publish your website
  def self.submit_publish
    @browser.button(css: @ready_to_launch_submit).fire_event 'click'
    return self
  end
  #when start publishing open modal -> close this opened modal
  def self.close_publishing_modal
    @browser.button(text: 'Hide').fire_event 'click'
    return self
  end
  def self.get_publishing_process
    return @browser.button(css: '.button_1BgCo.button_blue_2aXIf').text == 'Publishing'
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
  #cancel and close publish modal
  def self.cancel_publish
    @browser.button(text: 'Cancel').fire_event 'click'
    return self
  end
  #open published website by 'Open website' button
  def self.open_webliste_submit
    @browser.element(css: @open_publised_website).fire_event 'click'
    open_new_tab = @browser.window.(title: 'Home').exists?
    return self, open_new_tab
  end
end