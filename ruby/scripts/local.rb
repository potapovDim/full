require 'yaml'
require 'rspec'
require 'watir-webdriver'
#landing 
require_relative '../po/landing-page/index'
require_relative '../po/landing-page/plan'
require_relative '../po/landing-page/pricing'
require_relative '../po/landing-page/login'
require_relative '../po/landing-page/sign-up'
require_relative '../po/landing-page/plan'
require_relative '../po/landing-page/footer'
require_relative '../po/landing-page/concepts'
#account 
require_relative '../po/account/index'
require_relative '../po/account/my-profile'
require_relative '../po/account/my-websites'
#editor 
require_relative '../po/editor/index'
require_relative "../po/editor/top-nav/index"
#editor parts
#block
require_relative '../po/editor/block/index'
#elements
require_relative '../po/editor/elements/index'
#apps
require_relative '../po/editor/apps/index'
#left nav
require_relative '../po/editor/left-nav/index'
#row
require_relative '../po/editor/row/index'

CONFIG_NAME = ENV['CONFIG_NAME']
BROWSER_NAME = ENV['BROWSER_NAME']
CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../localdata/#{CONFIG_NAME}.yml")))

RSpec.configure do |config|
    # config.filter_run :focus => true
    config.around(:example) do |example|
    @browser = nil
    case BROWSER_NAME
      when 'chrome'
        @browser = Watir::Browser.new :chrome
      when 'firefox'
        @browser = Watir::Browser.new :firefox
    end
    # @browser  = Watir::Browser.new :chrome

    @username               = CONFIG['username']
    @password               = CONFIG['password']
    @base_url               = CONFIG['base_url']

    @username_expired       = CONFIG['username_expired']
    @password_expired       = CONFIG['password_expired']

    #landing po 
    @landing = LandingPage.new(@browser)
    #editor po
    @editor = Editor.new(@browser)
    begin
      @browser.driver.manage.timeouts.implicit_wait = 150
      example.run
    ensure
      # if example.exception
      #   Dir::mkdir('screenshots') if not File.directory?('screenshots')
      #   screenshot = "./screenshots/FAILED_#{example.full_description}.jpeg"
      #   @browser.driver.save_screenshot(screenshot)
      #   @browser.quit
      #   embed screenshot, 'image/jpeg'
      # end
      @browser.quit
    end
  end
end
