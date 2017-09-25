class SettingsRow
  def initialize(browser)
    @browser = browser
    #css selectors
    @background_tab = 'Background'
    @layout_tab = 'Layout'
    @shadow_tab = 'Shadow'
  end
  #background tab api
  def choose_tab(tab = "layout")
    case tab
      when "background"
        @browser.element(text: @background_tab).click
        return SubMenu.new @browser
      when "layout"
        @browser.element(text: @layout_tab).click
        return LayoutTab.new @browser
      when 'Shadow'
        @browser.element(text: @shadow_tab).click
        return BackgroundSettings.new @browser
    end
  end
end