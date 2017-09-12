class PassRecovery
    def initialize (browser)
        @browser = browser
        @email                  = '#id10'
        @back_to_sign_in        = 'a[href="/login"]'
        @title                  = '.title'
        @reset_button           = 'button[type="submit"]'
        @error_input_message    = '.field__message'        
    end
    def back_to_sign_in
        @browser.element(css:@back_to_sign_in).click
        return Login.new (@browser)
    end
    def set_email (email)
        @browser.element(css: @email).to_subtype.clear
        @browser.element(css: @email).send_keys email
    end
    def get_email_error
        return @browser.element(css: @error_input_message).text
    end 
    def drop_focus
        @browser.element(css: @reset_button).focus   
    end
    def click_reset
        @browser.element(css: @reset_button).click    
    end
end