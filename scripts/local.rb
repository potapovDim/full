require 'yaml'
require 'rspec'
require 'watir-webdriver'
#block
CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../localdata/userdata.yml")))
RSpec.configure do |config|
  config.around(:example) do |example|
    @browser              = Watir::Browser.new :chrome
    @username = CONFIG['username']
    @password = CONFIG['password']
    begin
      @browser.driver.manage.timeouts.implicit_wait = 150
      example.run
    ensure 
      @browser.quit
    end
  end
end
