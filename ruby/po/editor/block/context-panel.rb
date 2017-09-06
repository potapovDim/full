require_relative "./settings/index"
#context buttons block
class ContextPanelBlock
  def initialize(browser)
    @browser = browser     
    #css selectors
    @block_component = '[data-test="block-component"]'
    @open_settings = '[data-test="edit-button"]'
    @duplicate_block = '[data-test="context-panel-button-dublicate"]'
    @remove_block = '[data-test="context-panel-button-remove"]'
  end
  def helper_contextpanel(index)
    @browser.execute_script("window.scrollBy(0, -200)")
    if @browser.elements(css: @open_settings)[index].present?
      return true
    end
  end
  def block_remove(index)
    @browser.elements(css: @block_component)[index].hover
    @browser.elements(css: @block_component)[index].click
    @browser.wait_until {helper_contextpanel(index)}
    @browser.elements(css: @remove_block)[index].click
    return self
  end
  def block_duplicate(index)
    @browser.elements(css: @block_component)[index].hover
    @browser.elements(css: @block_component)[index].click
    @browser.wait_until {helper_contextpanel(index)}
    @browser.elements(css: @duplicate_block)[index].click
    return self
  end
  def open_block_settings (index)
    @browser.elements(css: @block_component)[index].hover
    @browser.elements(css: @block_component)[index].fire_event 'click'
    @browser.wait_until {helper_contextpanel(index)}
    @browser.elements(css: @open_settings)[index].click
    return SettingsBlock.new @browser
  end
end