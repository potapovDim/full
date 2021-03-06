class LeftNav
  #initialize drivers
  @@browser
  def initialize(browser)
    @@browser = browser
    #css selectors
    @@add_catalogue             = '[data-test="left-nav-button-Add"]>button'
    @@pages                     = '[data-test="left-nav-button-Pages"]>button'
    @@blocks                    = '[data-test="left-nav-button-Blocks"]>button'
    @@ui_kit                    = '[data-test="left-nav-button-Design"]>button'
  end
  #api methods
  def open_element_catalogue
    @@browser.element(css: @@add_catalogue).click
    return Add.new @@browser
  end

  def open_site_structure
    @@browser.element(css: @@pages).click
    return Pages.new @@browser
  end
  def present
    return @@browser.element(css: @@add_catalogue).wait_until_present
  end
end