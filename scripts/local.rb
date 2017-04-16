require 'rspec'
require 'watir-webdriver'
#block
RSpec.configure do |config|
  config.around(:example) do |example|
    @browser              = Watir::Browser.new :chrome
    
    begin
      @browser.driver.manage.timeouts.implicit_wait = 150
      example.run
    ensure 
      @browser.quit
    end
  end
end
