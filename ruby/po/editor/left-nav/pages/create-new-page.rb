class CreateNewPage
  #left nav paget 
  #css selectors
  def initialize(browser)
    @browser = browser
    @page                          = '[data-test="item-node-target"]'
    @page_name                     = '#CreatePageInput1'
    @page_url                      = '#CreatePageInput2'
    @cancel_button                 = 'button[title="Cancel"]'
    @add_page_button               = 'button[title="Add page"]'
    #initialize browser
  
  end
  #api methods
  def enter_page_name(name)
    @browser.element(css: @page_name).send_keys name
    return self
  end
  def enter_page_url(url)
    @browser.element(css: @page_url).send_keys url
    return self
  end
  def cancel_add_page
    @browser.element(css: @cancel_button).click
  end
  def add_page
    @browser.element(css: @add_page_button).click
    @browser.element(css: '[data-test="left-nav-button-Pages"]>button').click
    return @browser.elements(css: @page).length
  end
end