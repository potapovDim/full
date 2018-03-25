class NewTab
  def initialize(browser)
    #browser instance
    @browser = browser
    #css selector
    @portal_window                            = '[data-test="portal-window"]' #get window position
    @drag_modal                               = '[data-test="win-setting-header-drag-ico"]'
    @close_modal_button                       = '[data-test="win-setting-header-drag-ico"] ~ span'
    @page                                     = '[data-test="item-node-target"]'
    #selector for pages array
    @pages                                    = '[data-test="item-node-target"]'
  end
  #methods
  def open_page(page_number)
    @browser.elements(css: @page)[page_number].fire_event 'click'
  end
  def close_modal
    @browser.element(css: @close_modal_button).fire_event 'click'
  end
  
  def change_window_position(x, y)
    initial_position = @browser.element(css: @portal_window).style
    @browser.element(css: @portal_window).drag_and_drop_by(x,y)
    changed_position = @browser.element(css: @drag_modal).style
    return initial_position, changed_position, self
  end

  def get_pages_count
    return @browser.elements(css: @pages).length
  end

  def get_page_content (index)
    return @browser.elements(css: ".pages__item_3vlsq")[index].text
  end
end
