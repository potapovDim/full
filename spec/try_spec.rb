require_relative '../scripts/local.rb'

describe "Google's Search Functionality" do
  it "can find search results" do
    @browser.goto "https://weblium.co/"
    element = @browser.element(:name, 'q')
    element.send_keys "BrowserStack"
    element.onsubmit
    sleep 5
    expect(@browser.title).to eql("BrowserStack - Google Search")
  end
end



