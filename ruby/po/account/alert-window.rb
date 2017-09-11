class AlertWindow
    def initialize (browser)
        @browser = browser
        @buy_growth_plan            = '[data-test="Buy growth plan"]'
        @close_window               = '.window__close'
        @window_content             = '.window__content'
    end
    def present()
        return @browser.element(css: @window_content).wait_until_present
    end
    def close()
        @browser.element(css: @close_window).click
    end
end