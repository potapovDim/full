module NewTab
  #css selector
  @portal_window                            = '[data-test="portal-window"]' #get window position
  @drag_modal                               = '[data-test="win-setting-header-drag-ico"]'
  @close_modal_button                       = '[data-test="win-setting-header-drag-ico"] ~ span'
  @page                                     = '[data-test="item-node-target"]'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #methods
  def self.open_page(page_number)
    @browser.elements(css: @page)[page_number].fire_event 'click'
  end
  def self.close_modal
    @browser.element(css: @close_modal_button).fire_event 'click'
  end
  def self.change_window_position(x, y)
    initial_position = @browser.element(css: @drag_modal).style
    @browser.element(css: @drag_modal).drag_and_drop_by x, y
    changed_position = @browser.element(css: @drag_modal).style
    return self, initial_position, changed_position
  end
end
