class WebsiteSettings
  
  def initialize(driver)
    @browser = driver
    @site_name_banner                 = '.banner-tab__site.ellipsis' 
    @site_domain_banner               = '.banner-tab__link.ellipsis' 
    @buy_growth_plan                  = 'button.status__btn'
    @edit_website                     = '[data-test="Edit this website"]'
    @site_name_input                  = '#site'
    @remove_website                   = '[data-test="Delete website"]'
    @change_site_neme_save_button     = '[data-test="Save changes"]'
    @error_text                       = '.field__message'
    ##delete website modal
    @confirm_remove_input             = '#delete'
    @confirm_remove_button            = '[data-test="Confirm removal"]'
    @close_devete_website_modal       = '[data-test="simple-button"]'
    @removing_error                   = '.text_red'
 
  end

  def change_website_name(website_name)
    @browser.element(css: @site_name_input).when_present.to_subtype.clear    
    @browser.element(css: @site_name_input).send_keys website_name
    @browser.element(css: @change_site_neme_save_button).fire_event 'click'
    return self
  end
  def clear_name
    for i in 0..@browser.element(css: @site_name_input).value.length - 1
      @browser.element(css: @site_name_input).send_keys :backspace
    end
    return self    
  end
  def site_name_save
    @browser.element(css: @change_site_neme_save_button).click
  end
  def get_website_name_from_banner
    return @browser.element(css: @site_name_banner).when_present.text
  end

  def get_website_name_from_input
    return @browser.element(css: @site_name_input).when_present.value
  end
  def get_error
    return @browser.element(css: @error_text).when_present.text
  end 
  def set_confirm_input(confirming_phrase)
    @browser.element(css: @confirm_remove_input).send_keys(confirming_phrase)
    @browser.element(css: @confirm_remove_button).click
    return self
  end
  def get_removing_input_error
    @browser.element(css: @removing_error).when_present.text
  end
  def close_removing_window
    @browser.element(css: @close_devete_website_modal).click
  end
  def open_remove_modal
     @browser.element(css: @remove_website).click  
     return self 
  end
  def delete_website(confirming_phrase = "DELETE")
    set_confirm_input(confirming_phrase)
    close_removing_window()
  end
end
