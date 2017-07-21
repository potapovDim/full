require_relative "./create-new-page"

module Pages
  include CreateNewPage
  #pages
  #css selectors
  @pages_open                       = '[data-test="left-nav-button-Pages"]>button'
  @page                             = '[data-test="item-node-target"]'
  @layout_page_settings             = '[data-test="layout-button-settings"]'
  @submit_remove_page_button        = '[title="Remove page"]'
  #initialize browser
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #api methods
  def self.open_page_settings
    @browser.elements(css: @page_buttons)[0].click
    return self
  end
  def self.dublicate_page
    @browser.elements(css: @page_buttons)[1].click
    return self
  end
  def self.delete_page_last_page
    @browser.elements(css: @page)[@browser.elements(css: @page).length - 1].fire_event 'onmouseover'
    @browser.elements(css: @page)[@browser.elements(css: @page).length - 1].hover
    @browser.elements(css: @layout_page_settings)[@browser.elements(css: @page).length - 1].click
    @browser.element(css: @submit_remove_page_button).click
    return self
  end
  def self.get_pages_length
    return @browser.elements(css: @page).length
  end
  def self.create_new_page
    @browser.div(text: 'Create new page').click
    return CreateNewPage.initDriver(@browser)
  end
end