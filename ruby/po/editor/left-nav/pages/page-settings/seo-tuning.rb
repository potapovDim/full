class SEOTuning
  #seo tuning tab page settings 
  #css selectors
  def initialize (browser)
    @browser = browser
    @seo_keywords                  = 'input[placeholder]'
    @seo_title                     = '#seo-title'
    @seo_description               = 'textarea[name="seo-description"]'
    #initialize browser
  end
  #api methods
end