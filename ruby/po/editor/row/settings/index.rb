require_relative "../../share/background-settings"
require_relative "./layout"

class SettingsRow

  def initialize(browser)
    @browser = browser
    #css selectors
    @background_tab = 'Background'
    @layout_tab = 'Layout'
  end
  #background tab api
  def choose_tab(tab = "background")
    case tab
      when "background"
        @browser.element(text: @background_tab).click
        return BackgroundSettings.new @browser
      when "layout"
        @browser.element(text: @layout_tab).click
        return LayoutTab.new @browser
    end
  end
end