require_relative "../../share/settings-background-tab"
require_relative "./settings-appearance-tab.rb"

module SettingsBlock
  include BackgroundTab
  include AppearanceTab
  #css selectors
  @background_tab = 'Background'
  @appearance_tab = 'Appearance'

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
        return BackgroundTab.initDriver @browser
      when "appearance"
        @browser.element(text: @appearance_tab).click
        return AppearanceTab.initDriver @browser
    end
  end
end