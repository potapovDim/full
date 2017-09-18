require_relative '../../scripts/index.rb'

describe 'change settings' do
  before :each do
    @browser.window.resize_to 1600, 1200 
    @browser.goto @base_url
    @landing.login()
      .success_login_user(@username, @password) 
      .go_to_my_websites()    
  end
  it 'rename site' do
    @website_settings = MyWebsites.new(@browser).open_website_settings(0)
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
    expect(@website_settings.get_website_name_from_input).to eql("AAA")
    @website_settings.change_website_name("new website name")
    sleep 2
    expect(@website_settings.get_website_name_from_banner).to eql("new website name")
    expect(@website_settings.get_website_name_from_input).to eql("new website name")
    @website_settings.change_website_name("AAA")
    sleep 2    
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
    expect(@website_settings.get_website_name_from_input).to eql("AAA")
  end

  it 'site name validation' do
    @website_settings = MyWebsites.new(@browser).open_website_settings(0)
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
    expect(@website_settings.get_website_name_from_input).to eql("AAA")
    # @website_settings.clear_name()
    # sleep 5
    # @website_settings.site_name_save()
    # expect(@website_settings.get_error).to eql("This filed is required")
    @website_settings.change_website_name("dsadsadsadsadsadasdadsadsadsadsadsadasdadsadsadsadsadsadasda12345")
    expect(@website_settings.get_error).to eql("This filed should be 2 - 64 characters long") 
    @website_settings.change_website_name("1")    
    expect(@website_settings.get_error).to eql("This filed should be 2 - 64 characters long")
    sleep 2    
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
  end

end

  
  