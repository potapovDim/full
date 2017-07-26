require_relative '../../scripts/index.rb'

# , :focus => true if need run only this suit
describe 'Login user' do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end
  #fail part login
  it 'empty login data test' do
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
  end
  it 'pattern' do
    login_modal = @landing.login()
                .set_mail_input(' '+@username)
                .set_pass_input(@password)
                .submit_login()
    
    expect(@browser.url.include?('myaccount')).to eql(false)

    login_modal.set_mail_input(@username+' ')
              .set_pass_input(@password)
              .submit_login()

    expect(@browser.url.include?('myaccount')).to eql(false)

    login_modal.set_mail_input(@username)
              .set_pass_input(' '+@password)
              .submit_login()

    expect(@browser.url.include?('myaccount')).to eql(false)

    login_modal.set_mail_input(@username)
              .set_pass_input(@password+' ')
              .submit_login()

    expect(@browser.url.include?('myaccount')).to eql(false)
  end
  it 'failed login user' do
    el = @landing.login()
                 .fail_login_user('test@test.test', '!@##@!#!@$@!$@!')[0]
    expect(el.present?).to eql(true)
  end
  it 'get started (negative)' do
    el = @landing.get_started_login()
                 .fail_login_user('test@test.test', '!@##@!#!@$@!$@!')[0]
    expect(el.present?).to eql(true)
  end
  it 'sign up and start trial (negative)' do
    el = @landing.signup_and_freetrial_login()
                 .fail_login_user('test@test.test', '!@##@!#!@$@!$@!')[0]
    expect(el.present?).to eql(true)
  end
  it 'go concepts and succes login by fourth growth plan (negative)' do
    el = @landing
          .header_concepts_page()
          .go_to_login()
          .fail_login_user('test@test.test', '!@##@!#!@$@!$@!')[0]
    expect(el.present?).to eql(true)
  end
  it 'go pricing and login by first growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(0)
        .fail_login_user(' '+@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it 'go pricing and login by second growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(' '+@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it 'go pricing and login by third growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(2)
        .fail_login_user(@username,' '+@password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it 'go pricing and login by fourth growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(3)
        .fail_login_user(@username, @password+' ')
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it 'go pricing and login by second growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username, ' ')
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it 'go pricing and login by second growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username, '------------------------------')
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it 'go pricing and login by second growth plan (negative)' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username, '@#&*&Y$#*&^*$#')
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  #success part login
  it 'sucess login user' do
    @landing.login().success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'get started (success login)' do
    @landing.get_started_login().success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'sign up and start trial (success login)' do
    @landing.signup_and_freetrial_login().success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing and success login by first growth plan' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(0)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing and success login by second growth plan' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing and success login by third growth plan' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(2)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing and success login by fourth growth plan' do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(3)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  #concets header
  it 'go concepts and success login by fourth growth plan' do
    @landing
        .header_concepts_page()
        .go_to_login()
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/website/create/')).to eql(true)
  end
  it 'go pricing from footer and success login by first growth plan' do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(0)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing from footer and success login by second growth plan' do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(1)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing from footer and success login by third growth plan' do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(2)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it 'go pricing from footer and success login by fourth growth plan' do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(3)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
end
