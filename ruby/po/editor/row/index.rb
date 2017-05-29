require_relative "context-panel"

class Row
  include ContextPanelRow
  #initialize drivers
  @@browser
  def initialize(browser, row_target)
    @@row_background = '.row'
    @@row_target = row_target
    @@browser = browser
    ContextPanelRow.initBrowser browser
  end
  #row context panel api
  def click_row_context (button)
    case button
      when "remove"
        ContextPanelRow.row_remove(@@row_target)
      when "duplicate"
        ContextPanelRow.row_duplicate(@@row_target)
      when "settings"
        ContextPanelRow.open_row_settings(@@row_target)
    end
  end
  def get_row_background
    return @@browser.elements(css: @@row_background)[@@row_target].style 'background'
  end
end
