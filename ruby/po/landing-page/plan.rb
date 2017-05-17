require_relative './login'
require_relative './pricing'
require_relative './concepts'

module Plan
  include Login
  include Pricing
  include Concepts
  #header
  @pricing                  = 'a[href="/pricing"]'
  # will features
  @concepts                 = 'a[href="/concepts"]'
  #
  @about                    = 'a[href="/about"]'
  #selectors
  @your_website_name                    = '#website'
  @website_option                       = 'option'
  #plans 
  @annually_plan                        = '#annually' #15 per/month
  @monthly_plan                         = '#monthly' # 10.5 per/month
  @biannually_plan                      = '#biannually' # 8.25 per/month
  #payment way
  @stripe                               = '#stripe' 
  @paypal                               = '#paypal' 
  #promocode enter 
  @promocode_button                     = 'button[title="Enter promo code"]' #open promo code input
  @promocode_input                      = 'input#promo' 
  @promocode_submit                     = 'button[title="Submit"]'

  def self.initDriver(driver)
    @browser = driver
    return self
  end

  def self.pricing_page
    @browser.element(css: @pricing).click
    return Pricing.initDriver(@browser)
  end

  def self.concepts_page
    @browser.element(css: @concepts).click
    return Concepts.initDriver(@browser)
  end
end