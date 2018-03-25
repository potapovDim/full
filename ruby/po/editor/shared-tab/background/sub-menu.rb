class SubMenu
    def initialize (browser)
        @browser = browser
        @color_tab                  = '[data-test="page-settings-tab-color"]'
        @image_tab                  = '[data-test="page-settings-tab-image"]'
        @gradient_tab               = '[data-test="page-settings-tab-gradient"]'
        @active_tab                 = '.tabs__controlItem.active'
    end
    def swich_tab (tabname)
        puts get_active_tab
        case tabname
            when 'Color'
                if get_active_tab != 'Color'                    
                    @browser.element(text: @color_tab).click
                end
                return ColorTab.new @browser
            when "Image"
                if get_active_tab != 'Image'                    
                    @browser.element(css: @image_tab).click
                end
                return ImageTab.new @browser
            when 'Gradient'
                if get_active_tab != 'Gradient'                    
                    @browser.element(css: @gradient_tab).click
                end
                return GradienTab.new @browser                    
            end
    end
    def get_active_tab
        return @browser.elements(css: @active_tab)[1].text
    end
end