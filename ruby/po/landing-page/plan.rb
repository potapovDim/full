class Plan
  #init driver instance
  def initialize(driver)
    @browser = driver
    @pricing                              = 'a[href="/pricing"]'
    # will features
    @concepts                             = 'a[href="/concepts"]'
    @about                                = 'a[href="/about"]'
    #selectors
    @your_website_name                    = '#website'
    @website_option                       = 'option'
    #plans 
    @annually_plan                        = '#annually' # 15 per/month
    @monthly_plan                         = '#monthly' # 10.5 per/month
    @biennially_plan                      = '#biennially' # 8.25 per/month
    #payment way
    @stripe                               = '#stripe' 
    @paypal                               = '#paypal' 
    #promocode enter 
    @promocode_button                     = 'button[title="Enter promo code"]' #open promo code input
    @promocode_input                      = 'input#promo' 
    @promocode_submit                     = 'button[title="Submit"]'
    @promocode_submit_error               = '.footer-form__notice.error'
    #day price when choosed plan
    @day_price                            = '.total-pay__price'
  end

  def pricing_page
    @browser.element(css: @pricing).click
    return Pricing.new @browser
  end

  def concepts_page
    @browser.element(css: @concepts).click
    return Concepts.new @browser
  end

  def choose_your_payment_method(payment_method)
    case payment_method
      when "annually"
        @browser.element(css: @annually_plan).fire_event 'click'
      when "monthly"
        @browser.element(css: @monthly_plan).fire_event 'click'
      when "binnualy"
        @browser.element(css: @biennially_plan).fire_event 'click'
    end
    return self, @browser.element(css: @day_price).text
  end
  def enter_promocode_fail(promo_code)
    @browser.element(css: @promocode_button).click
    @browser.element(css: @promocode_input).send_keys promo_code
    @browser.element(css: @promocode_submit).click
    return self, @browser.element(css: @promocode_submit_error).text
  end
end