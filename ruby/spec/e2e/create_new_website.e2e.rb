require_relative '../../scripts/index.rb'

describe 'Create new website from concept' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
  end
  it 'create' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    expect(start_magic.get_all_blocks_checkbox_status(true)).to eql(true)
    start_magic.disable_all_blocks()
    expect(start_magic.get_all_blocks_checkbox_status(false)).to eql(true)
    start_magic.disable_enable_block(0)
    expect(start_magic.get_checkbox_status(0)).to eql(true)
    start_magic.next_step()
    start_magic.play_with_design_present()
    start_magic.next_step()
    start_magic.almost_done_present()
    start_magic.set_site_name()
    expect(start_magic.get_site_name).to eql("test_site")
    start_magic.final_step()
    expect(Login.new(@browser).login_fields_presented?).to eql(true)
  end
  #test case coverage <53>
  it 'create site as unauthorized user' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.skip_magic
    start_magic.set_site_name()
    start_magic.final_step()
    start_magic.get_login.success_login_user(@username_expired, @password_expired)
    start_magic.loading_title_present()
    LeftNav.new(@browser).present()
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    clear_useless_user_websites(@username_expired,@password_expired,true,false)
  end

  it 'magic start if user have 10 sites' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.skip_magic
    start_magic.set_site_name()
    start_magic.final_step()
    start_magic.get_login.success_login_user(@user_with_10_site, @password_with_10_site)
    allert_window = AlertWindow.new(@browser)
    allert_window.present
    allert_window.close
  end
  it 'clear fb accout' do
    login = @landing.login().go_to_fb_login()
    expect(@browser.url.include?("facebook")).to eql(true)
    login.facebook_login(@fb_email, @fb_pass)
    expect(@browser.url.include?("/myaccount/websites")).to eql(true)
    sleep 2
    token = @browser.execute_script('return localStorage.auth')
    result = clear_useless_user_websites(token,true,false)
  end
  it 'fb login at magic start' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.skip_magic
    start_magic.set_site_name()
    start_magic.final_step()
    login = start_magic.get_login
    login.go_to_fb_login
    expect(@browser.url.include?("facebook")).to eql(true)
    login.facebook_login(@fb_email, @fb_pass)
    start_magic.loading_title_present()
    LeftNav.new(@browser).present()
    expect(@browser.url.include?('/editor/website/')).to eql(true)
  end
  it 'google login at magic start' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.skip_magic
    start_magic.set_site_name()
    start_magic.final_step()
    login = start_magic.get_login
    login.go_to_google_login
    expect(@browser.url.include?("google")).to eql(true)
    login.google_login(@google_email, @google_pass)
    start_magic.loading_title_present()
    LeftNav.new(@browser).present()
    expect(@browser.url.include?('/editor/website/')).to eql(true) 
  end
  it 'skip magic start' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.skip_magic
    start_magic.almost_done_present()
  end
  it 'breadcrumbs go to concepts' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.go_to_consepts_page(0)
    expect(@browser.url).to eql(@base_url + "concepts")
  end
  it 'breadcrumbs go to concept category' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.go_to_consepts_page(1)
    expect(@browser.url).to eql(@base_url + "concepts/beautyandfashion")
  end
end
