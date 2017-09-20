require_relative './deps'

CONFIG_NAME = ENV['CONFIG_NAME']
BROWSER_NAME = ENV['BROWSER_NAME']
NEED_SCREEN = ENV['NEED_SCREEN']

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../config/#{CONFIG_NAME}.yml")))

RSpec.configure do |config|
    # config.filter_run :focus => true
    config.around(:example) do |example|
  # config.before :each do
    @browser = nil
    case BROWSER_NAME
      when 'chrome'
        @browser = Watir::Browser.new :chrome
      when 'firefox'
        @browser = Watir::Browser.new :firefox
    end
    @username               = CONFIG['username']
    @password               = CONFIG['password']
    @base_url               = CONFIG['base_url']

    @username_expired       = CONFIG['username_expired']
    @password_expired       = CONFIG['password_expired']

    @username_remove        = CONFIG['username_remove']
    @password_remove        = CONFIG['password_expired']

    @user_with_10_site      = CONFIG['user_with_10_site']
    @password_with_10_site  = CONFIG['password_with_10_site']

    @fb_email               = CONFIG['fb_email']
    @fb_pass                = CONFIG['fb_pass']
    
    @google_email           = CONFIG['google_email']
    @google_pass            = CONFIG['google_pass']

    if @base_url == 'http://weblium.dev/'
      print '!!!!!!!!!!!!!!!!!!!!!!! elasticsearch assert'
      assert_elasticsearch_run
    end
    #landing po 
    @landing = LandingPage.new(@browser)
    #editor po
    @editor = Editor.new(@browser)
    @browser.driver.manage.timeouts.implicit_wait = 10
  # end
  # config.after :each do
  #   @browser.close 
  # end
    begin
      example.run
    ensure
      if example.exception && NEED_SCREEN
        Dir::mkdir('screenshots') if not File.directory?('screenshots')
        screenshot = "./screenshots/FAILED_#{example.full_description}.png"
        @browser.driver.save_screenshot(screenshot)
        @browser.quit
        #embed screenshot, 'image/png'
      end
      @browser.quit
    end
  end
end
