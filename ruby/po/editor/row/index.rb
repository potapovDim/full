require_relative "context-panel"

class Row
  include ContextPanelRow
  #initialize drivers
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanelRow.initBrowser browser
  end
  #block context panel api
  def click_row_context (button, index = 0)
    case button
      when "remove"
        ContextPanelRow.row_remove(index)
      when "duplicate"
        ContextPanelRow.row_duplicate(index)
      when "settings"
        ContextPanelRow.open_row_settings(index)
    end
  end
end
