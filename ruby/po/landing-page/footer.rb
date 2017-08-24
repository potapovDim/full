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
    @twitter                  = 'a[href="https://twitter.com/WebliumTeam"]'
    @linkedin                 = 'a[href="https://www.linkedin.com/company-beta/17969770/"]'
    #
    @privacy_policy           = 'a[href="/policy"]'
    @terms_of_use             = 'a[href="/terms"]'
  end

  def pricing_page
    @browser.element(css: @pricing).click
    return Pricing.new @browser
  end

  def concepts_page
    @browser.element(css: @concepts).click
    return Concepts.new @browser
  end
end