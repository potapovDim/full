require_relative "./add/index"
require_relative "./pages/index"

class LeftNav
  #css selectors
  @@add_catalogue             = '[data-test="left-nav-button-Add"]>button'
  @@pages                     = '[data-test="left-nav-button-Pages"]>button'
  @@blocks                    = '[data-test="left-nav-button-Blocks"]>button'
  @@ui_kit                    = '[data-test="left-nav-button-Design"]>button'
  #initialize drivers
  @@browser
  def initialize(browser)
    @@browser = browser
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
end