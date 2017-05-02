require_relative './pricing'
require_relative './concepts'

module Footer
  include Pricing
  include Concepts
  #selectors
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


  def self.pricing_page
    @browser.execute_script("window.scrollBy(0, 150000)")
    @browser.element(css: @pricing).click
    return Pricing.initDriver(@browser)
  end

  def self.concepts_page
    @browser.execute_script("window.scrollBy(0, 150000)")
    @browser.element(css: @concepts).click
    return Concepts.initDriver(@browser)
  end
end