module WebsiteSettings
  #general part selectors
  @site_name_banner                 = '.banner-tab__site.ellipsis' 
  @site_domain_banner               = '.banner-tab__link.ellipsis' 
  @buy_growth_plan                  = 'button.status__btn'
  @edit_website                     = '[data-test="Edit this website"]'
  @site_name_input                  = '#site'
  @remove_website                   = '[data-test="Remove website"]'
  @change_site_neme_save_button     = '[data-test="Save changes"]'
  ##delete website modal
  @confirm_remove_input             = '#delete'
  @confirm_remove_button            = '[data-test="Confirm removal"]'
  @close_devete_website_modal       = '[data-test="simple-button"]'
  
  def self.initDriver(driver)
    @browser = driver
    return self
  end

  def self.change_website_name(website_name)
    @browser.element(css: @site_name_input).send_keys website_name
    @browser.element(css: @change_site_neme_save_button).fire_event 'click'
    return self
  end

  def self.get_website_name_from_banner
    return @browser.element(css: @site_name_banner).text, self
  end

  def self.get_website_name_from_input
    return @browser.element(css: @site_name_input).value, self
  end
end
