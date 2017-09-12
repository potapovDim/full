require_relative '../../scripts/index.rb'

#, :focus => true if need run only this suit
describe 'Login user' do
  describe 'Fail login' do
    before :each do
      @browser.window.resize_to 1600, 1200
      @browser.goto @base_url
    end
    #test case coverage <43 46>
    it 'assert pattern and valid' do
      error_pass, login_modal = @landing.login()
                  .set_mail_input('test@test.test')
                  .submit_login()
                  .get_input_error('pass')

      expect(error_pass.text).to eql('This filed is required')

      error_name, login_modal = login_modal
                .set_mail_input(nil)
                .set_pass_input(1232131)
                .submit_login()
                .get_input_error('name')
      expect(error_name.text).to eql('This filed is required')

      error_name, error_pass, login_modal = login_modal.set_mail_input(nil)
                .set_pass_input(nil)
                .submit_login()
                .get_input_error('both')

      expect(error_name.text).to eql('This filed is required')
      expect(error_pass.text).to eql('This filed is required')

      login_modal = login_modal.set_mail_input(' ' + @username)
                .set_pass_input(@password)
                .submit_login()

      expect(@browser.url.include?('myaccount')).to eql(false)

      login_modal = login_modal.set_mail_input(@username + ' ')
                .set_pass_input(@password)
                .submit_login()

      expect(@browser.url.include?('myaccount')).to eql(false)

      login_modal = login_modal.set_mail_input(@username)
                .set_pass_input(@password+ ' ')
                .submit_login()

      expect(@browser.url.include?('myaccount')).to eql(false)
      
      login_modal = login_modal.set_mail_input(@username)
                .set_pass_input(' ' + @password)
                .submit_login()

      expect(@browser.url.include?('myaccount')).to eql(false)

      el, login_modal = login_modal.fail_login_user('test@test.test', '!@##@!#!@$@!$@!')

      expect(el.present?).to eql(true)
    end
  end
  describe 'Success login' do
    before :each do
      @browser.window.resize_to 1600, 1200
      @browser.goto @base_url
    end
    #test case coverage <9 20 23>
    it 'sucess login user' do
      @landing.login().success_login_user(@username, @password)
      expect(@browser.url.include?('/myaccount/websites')).to eql(true)

      @browser.goto @base_url
      @landing.get_started_login()
      sleep 0.5 
      expect(@browser.url.include? '/concepts').to eql(true)

      @browser.goto @base_url
      @landing.signup_and_freetrial_login()
      sleep 0.5 
      expect(@browser.url.include? '/concepts').to eql(true)
    end
    #test case coverage <7 16>
    it 'fb login' do
      login = @landing.login().go_to_fb_login()
      expect(@browser.url.include?("facebook")).to eql(true)
      login.facebook_login(@fb_email, @fb_pass)
      expect(@browser.url.include?("/myaccount/websites")).to eql(true)
    end
  #test case coverage <8 17>
    it 'google login' do
      login = @landing.login().go_to_google_login()
      expect(@browser.url.include?("google")).to eql(true)
      login.google_login(@google_email, @google_pass)
      expect(@browser.url.include?("/myaccount/websites")).to eql(true)
    end
  end
  
  #test case coverage <42 49 >
  describe 'Sing up' do
    before :each do
      @browser.window.resize_to 1600, 1200
      @browser.goto @base_url
    end
    it 'sing up test' do
      @sign_up = @landing.login.go_to_signup()
      sleep 0.5
      @sign_up.click_submit()
      expect(@sign_up.get_email_error.include?("This filed is required")).to eql(true)
      expect(@sign_up.get_email_error.include?("This filed is required")).to eql(true)
      expect(@sign_up.get_pass_error.include?("This filed is required")).to eql(true)

      emails = ["missing.dog.com","TextWithDog@","@MIssingUserName.com","Double@dog@d.com"]
      emails.each do |email| 
        @sign_up.set_email(email)
        @sign_up.drop_focus()
        expect(@sign_up.get_email_error).to eql("Field doesn't match requirements")
      end
      @sign_up.set_pass("12345")
      @sign_up.set_email(@username)      
      @sign_up.click_submit()
      expect(@sign_up.get_pass_error).to eql("This filed should be at least 6 characters long")
      @sign_up.set_pass("123456")
      expect(@sign_up.get_pass_error).to eql("")
    end
    #test case coverage <44>
    it 'reset password validation' do
      @forgot_pass = @landing.login().go_to_forgot_pass()
      @forgot_pass.click_reset
      expect(@forgot_pass.get_email_error.include?("This filed is required")).to eql(true)
      emails = ["missing.dog.com","TextWithDog@","@MIssingUserName.com","Double@dog@d.com"]
      emails.each do |email| 
        @forgot_pass.set_email(email)
        @forgot_pass.drop_focus()
        expect(@forgot_pass.get_email_error).to eql("Field doesn't match requirements")
      end
    end
  end
end
