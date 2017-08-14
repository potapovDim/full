require_relative "./context-panel"

class Breadcrumbs
  include BreadcrumbsContextPanel
  #css selectors
  @@draggable_contact_form = '[data-test="draggable-element-breadcrumbs"]' #draggable decorator selector
  #@extensions_line = '[data-test="extensions-container-none"]'
  #browser instance
  @@browser
  def initialize(browser)
    @@browser = browser
    BreadcrumbsContextPanel.initDriver @@browser
  end
  #methods
  def focus_element 
    @@browser.element(css: @@draggable_contact_form).fire_event "mousedown"
  end
  def context_panel_action(align="align center")
    BreadcrumbsContextPanel.click_context_item align
  end
end