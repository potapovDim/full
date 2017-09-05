require_relative "./create-new-page"

class Pages
  def initialize(browser)
    #initialize browser
    @browser = browser
    #pages
    #css selectors
    @pages_open                       = '[data-test="left-nav-button-Pages"]>button'
    @page                             = '[data-test="item-node-target"]'
    @layout_page_settings             = '[data-test="layout-button-settings"]'
    @submit_remove_page_button        = '[title="Remove page"]'
  end
  def initDriver(browser)

    return self
  end
  #api methods
  def open_page_settings
    @browser.elements(css: @page_buttons)[0].click
    return self
  end
  def dublicate_page
    @browser.elements(css: @page_buttons)[1].click
    return self
  end
  def delete_page_last_page
    @browser.elements(css: @page)[@browser.elements(css: @page).length - 1].fire_event 'onmouseover'
    @browser.elements(css: @page)[@browser.elements(css: @page).length - 1].hover
    @browser.elements(css: @layout_page_settings)[@browser.elements(css: @page).length - 1].click
    @browser.element(css: @submit_remove_page_button).click
    return self
  end
  def get_pages_length
    return @browser.elements(css: @page).length
  end
  def create_new_page
    @browser.div(text: 'Create new page').click
    return CreateNewPage.new(@browser)
  end
end