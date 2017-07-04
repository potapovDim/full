require_relative "./settings/index"
#context buttons row
module ContextPanelRow
  include SettingsRow
  #css selectors
  @block_component                 = '[data-test="block-component"]'
  @row_component                   = '.row'
  @row_duplicate_button            = '[data-test="duplicate-row-button"]'
  @row_remove_button               = '[data-test="row-settings-delete-row"]'
  @row_settings_button             = '[data-test="row-settings-open-layout"]'
  @row_drag                        = '[data-test="row-settings"]>[draggable="true"]'
  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
  end
  def self.helper_contextpanel(index)
    @browser.execute_script("window.scrollBy(0, -100)")
    if @browser.elements(css: @row_settings_button)[index].present?
      return true
    end
  end
  def self.row_remove(index)
    @browser.elements(css: @row_component)[index].hover
    @browser.wait_until {self.helper_contextpanel(index)}
    @browser.elements(css: @row_remove_button)[index].click
    return self
  end
  def self.row_duplicate(index)
    @browser.elements(css: @row_component)[index].hover
    @browser.wait_until {self.helper_contextpanel(index)}
    @browser.elements(css: @row_duplicate_button)[index].click
    return self
  end
  def self.open_row_settings (index)
    @browser.elements(css: @row_component)[index].hover
    @browser.wait_until {self.helper_contextpanel(index)}
    @browser.elements(css: @row_settings_button)[index].click
    return SettingsRow.initDriver @browser
  end
end