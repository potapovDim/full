require_relative "../../share/background-settings"
require_relative "./layout"

module SettingsRow
  include LayoutTab
  #css selectors
  @background_tab = 'Background'
  @layout_tab = 'Layout'

  #browser instance
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #background tab api
  def self.choose_tab(tab = "background")
    case tab
      when "background"
        @browser.element(text: @background_tab).click
        return BackgroundSettings.new @browser
      when "layout"
        @browser.element(text: @layout_tab).click
        return LayoutTab.initDriver @browser
    end
  end
end