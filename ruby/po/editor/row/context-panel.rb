#context buttons row
class ContextPanelRow
  def initialize(browser)
    @browser = browser    
    #css selectors
    @block_component                 = '[data-test="block-component"]'
    @row_component                   = '.row'
    @row_duplicate_button            = '[data-test="duplicate-row-button"]'
    @row_remove_button               = '[data-test="row-settings-delete-row"]'
    @row_settings_button             = '[data-test="row-settings-open-layout"]'
    @row_drag                        = '[data-test="row-settings"]>[draggable="true"]'
  end
  def helper_contextpanel(index)
    @browser.execute_script("window.scrollBy(0, -100)")
    if @browser.elements(css: @row_settings_button)[index].present?
      return true
    end
  end
  def row_remove(index)
    @browser.elements(css: @row_component)[index].hover
    @browser.wait_until {helper_contextpanel(index)}
    @browser.elements(css: @row_remove_button)[index].click
    return self
  end
  def row_duplicate(index)
    @browser.elements(css: @row_component)[index].hover
    @browser.wait_until {helper_contextpanel(index)}
    @browser.elements(css: @row_duplicate_button)[index].click
    return self
  end
  def open_row_settings (index)
    @browser.elements(css: @row_component)[index].hover
    @browser.wait_until {helper_contextpanel(index)}
    @browser.elements(css: @row_settings_button)[index].click
    return SettingsRow.new @browser
  end
end