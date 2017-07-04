module SEOTuning
  #seo tuning tab page settings 
  #css selectors
  @seo_keywords                  = 'input[placeholder]'
  @seo_title                     = '#seo-title'
  @seo_description               = 'textarea[name="seo-description"]'
  #initialize browser
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #api methods
end