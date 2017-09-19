require_relative '../../scripts/index.rb'
#test case coverage <63 64 65>
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
    sleep 0.5
    expect(@website_settings.get_website_name_from_banner).to eql("new website name")
    expect(@website_settings.get_website_name_from_input).to eql("new website name")
    @website_settings.change_website_name("AAA")
    sleep 0.5    
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
    expect(@website_settings.get_website_name_from_input).to eql("AAA")
  end

  it 'site name validation' do
    @website_settings = MyWebsites.new(@browser).open_website_settings(0)
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
    expect(@website_settings.get_website_name_from_input).to eql("AAA")  
    @website_settings.clear_name().site_name_save()
    expect(@website_settings.get_error).to eql("This filed is required")
    @website_settings.change_website_name("dsadsadsadsadsadasdadsadsadsadsadsadasdadsadsadsadsadsadasda12345")
    expect(@website_settings.get_error).to eql("This filed should be 2 - 64 characters long") 
    @website_settings.change_website_name("1")    
    expect(@website_settings.get_error).to eql("This filed should be 2 - 64 characters long")
    sleep 0.5   
    expect(@website_settings.get_website_name_from_banner).to eql("AAA")
  end
end
#test case coverage <66 67 68>
  describe ' site removing' do
    before do
      if get_website_number(@username, @password) <= 1
        Thread.new {add_user_website(@username, @password)} 
      end
    end
    before :each do
      @browser.window.resize_to 1600, 1200 
      @browser.goto @base_url
      @landing.login()
        .success_login_user(@username, @password) 
        .go_to_my_websites()    
    end
    it 'site removing validation' do
      website_count = get_website_number(@username, @password)
      @website_settings = MyWebsites.new(@browser).open_website_settings(website_count - 1)
                                                  .open_remove_modal()
                                                  .set_confirm_input("")
      expect(@website_settings.get_removing_input_error).to eql("Wrong input. Please follow instructions.")
      @website_settings.set_confirm_input("delet")
      expect(@website_settings.get_removing_input_error).to eql("Wrong input. Please follow instructions.")
      @website_settings.close_removing_window()
      expect(get_website_number(@username, @password)).to eql(website_count)
      sleep 1
      expect(MyWebsites.new(@browser).get_website_count).to eql(website_count)
    end
    it 'site removing' do
      website_count = get_website_number(@username, @password)
      @website_settings = MyWebsites.new(@browser).open_website_settings(1)
                                                  .open_remove_modal()
                                                  .delete_website()
      expect(get_website_number(@username, @password)).to eql(website_count - 1)
      sleep 1
      expect(MyWebsites.new(@browser).get_website_count).to eql(website_count -1)
    end
end

  
  