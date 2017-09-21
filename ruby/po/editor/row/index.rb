class Row
  #initialize drivers
  def initialize(browser, row_target)
    @row_background            = '.row'
    @row_target                = row_target
    @browser                   = browser
    @column_context_panel      = '[data-test="column-context-panel"]'
    @row_context_panel         = ContextPanelRow.new(browser)
  end
  #row context panel api
  def hover_current_row
    el = @browser.driver.find_element(:css, @row_background)
    @browser.driver.action.move_to(el).perform
    return self
  end
  def click_row_context (button)
    case button
      when "remove"
        @row_context_panel.row_remove(@row_target)
      when "duplicate"
        @row_context_panel.row_duplicate(@row_target)
      when "settings"
        @row_context_panel.open_row_settings(@row_target)
        return SettingsRow.new(@browser)
    end
  end

  def get_row_background
    return @browser.elements(css: @row_background)[@row_target].style 'background'
  end

  def get_row_layout
    return @browser.elements(css: @row_background)[@row_target].elements(css: @column_context_panel).length
  end
  #true - margin exist
  #false - margin do not exist
  def intend_between_columns?
    return !@browser.elements(css: @row_background)[@row_target].class_name.include?("noMargin_")
  end
end
