require_relative "context-panel"

class Row
  #initialize drivers
  @@browser
  def initialize(browser, row_target)
    @@row_background            = '.row'
    @@row_target                = row_target
    @@browser                   = browser
    @@column_context_panel      = '[data-test="column-context-panel"]'
    @@row_context_panel         = ContextPanelRow.new browser
  end
  #row context panel api
  def hover_current_row
    @@browser.element(css: @@row_background, index: @@row_target).fire_event 'hover'
  end
  def click_row_context (button)
    case button
      when "remove"
        @@row_context_panel.row_remove(@@row_target)
      when "duplicate"
        @@row_context_panel.row_duplicate(@@row_target)
      when "settings"
        @@row_context_panel.open_row_settings(@@row_target)
    end
  end

  def get_row_background
    return @@browser.elements(css: @@row_background)[@@row_target].style 'background'
  end

  def get_row_layout
    return @@browser.elements(css: @@row_background)[@@row_target].elements(css: @@column_context_panel).length
  end
end
