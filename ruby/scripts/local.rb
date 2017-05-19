require 'yaml'
require 'rspec'
require 'watir-webdriver'
require_relative '../po/landing-page/index'

CONFIG_NAME = ENV['CONFIG_NAME']
BROWSER_NAME = ENV['BROWSER_NAME']
CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../localdata/#{CONFIG_NAME}.yml")))
RSpec.configure do |config|
  config.filter_run :focus => true
  config.around(:example) do |example|
    @browser = nil
    case BROWSER_NAME
      when 'chrome'
        @browser = Watir::Browser.new :chrome
      when 'firefox'
        @browser = Watir::Browser.new :firefox
    end
    # @browser  = Watir::Browser.new :chrome
    @username = CONFIG['username']
    @password = CONFIG['password']
    @base_url = CONFIG['stage_url']

    @landing = LandingPage.new(@browser)

    begin
      @browser.driver.manage.timeouts.implicit_wait = 150
      example.run
    ensure 
      @browser.quit
    end
  end
end
