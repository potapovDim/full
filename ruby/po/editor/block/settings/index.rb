class SettingsBlock
  def initialize(browser)
    @browser = browser
    #css selectors
    @background_tab = 'Background'
    @appearance_tab = 'Appearance'
  end
  #background tab api
  def choose_tab(tab = "background")
    case tab
      when "background"
        @browser.element(text: @background_tab).click
        return BackgroundSettings.new @browser
      when "appearance"
        @browser.element(text: @appearance_tab).click
        return AppearanceTab.new @browser
    end
  end
end