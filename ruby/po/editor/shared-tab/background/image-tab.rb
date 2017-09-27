class ImageTab
    def initialize (browser)
        @browser = browser
        @upload_photo           = 'button[title="Browse files"]'
        #present after photo uploading
        @change_image           = 'button[title="Change image"]'
        @clear_image            = 'button[title="Clear image"]'

        @background_settings    = '.moreSettings__btn'
        @clear_background       = '.moreSettings__btn_remove'
        #reset all settings
        @reset_button           = 'button[title="Reset"]'
    end
    def reset
        @browser.element(css: @reset_button).click
        return self
    end
    def open_media_gallery
        @browser.element(css: @upload_photo ).click
        return MediaGallery.new @browser
    end
    def change_image
        @browser.element(css: @change_image ).click
        return MediaGallery.new @browser
    end
    def clear_image
        @browser.element(css: @clear_image ).click
        return self
    end
    def open_background_settings
        @browser.elements(css: @background_settings)[1].click
        return BackgroundSettings.new @browser
    end
    def clear_background_settings
        @browser.elements(css: @clear_background)[0].click
        return self
    end

end