class Footer
  # include Pricing
  # include Concepts
  #selectors
  def initialize(driver)
    @browser                  = driver
    @pricing                  = 'a[href="/pricing"]'
    # will features
    @concepts                 = 'a[href="/concepts"]'
    #
    @about                    = 'a[href="/about"]'
    #
    @blog                     = 'a[href="http://blog.weblium.com/"]'
    @facebook                 = 'a[href="https://www.facebook.com/weblium/"]'
    @twitter                  = 'a[href="https://twitter.com/Weblium"]'
    @linkedin                 = 'a[href="https://www.linkedin.com/company-beta/17969770/"]'
    #
    @support_center           = 'a[href="http://support.weblium.com/"]'
    @privacy_policy           = 'a[href="/policy"]'
    @terms_of_use             = 'a[href="/terms"]'             
  end
  def get_pricing_page
    @browser.element(css: @pricing).click
    return Pricing.new @browser
  end

  def get_concepts_page
    @browser.element(css: @concepts).click
    return Concepts.new @browser
  end
  def go_to_pricing_page
    @browser.element(css: @pricing).click
  end

  def go_to_concepts_page
    @browser.element(css: @concepts).click
  end

  def go_to_about
    @browser.element(css: @about).click 
  end
  def go_to_blog
    @browser.element(css: @blog).click 
  end
  def go_to_facebook
    @browser.element(css: @facebook).click 
  end
  def go_to_twitter
    @browser.element(css: @twitter).click 
  end
  def go_to_linkedin
    @browser.element(css: @linkedin).click 
  end
  def go_to_support_center
    @browser.element(css: @support_center).click 
  end
  def go_to_privacy_policy
    @browser.element(css: @privacy_policy).click 
  end
  def go_to_terms_of_use
    @browser.element(css: @terms_of_use).click 
  end

end