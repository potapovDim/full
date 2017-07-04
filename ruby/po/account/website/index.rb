module Website
  #general part selectors
  @site_name_banner                 = '.banner-tab__site.ellipsis' 
  @site_domain_banner               = '.banner-tab__link.ellipsis' 
  @buy_growth_plan                  = 'button.status__btn'
  @edit_website                     = '[data-test="Edit this website"]'
  @site_name                        = '#site'
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
end
