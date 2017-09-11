require_relative '../../scripts/index.rb'

#, :focus => true if need run only this suit
describe 'Login user' do
  describe 'Fail login' do
    before :each do
      @browser.window.resize_to 1600, 1200
      @browser.goto @base_url
    end
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
    it 'sucess login user' do
      @landing.login().success_login_user(@username, @password)
      expect(@browser.url.include?('/myaccount/websites')).to eql(true)
    end
    it 'fb login' do
    login = @landing.login().go_to_fb_login()
    expect(@browser.url.include?("facebook")).to eql(true)
    login.facebook_login(@fb_email, @fb_pass)
    expect(@browser.url.include?("/myaccount/websites")).to eql(true)
    end
    it 'google login' do
      login = @landing.login().go_to_google_login()
      expect(@browser.url.include?("google")).to eql(true)
      login.google_login(@google_email, @google_pass)
      expect(@browser.url.include?("/myaccount/websites")).to eql(true)
    end
  end
end
