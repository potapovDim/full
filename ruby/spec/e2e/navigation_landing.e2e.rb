require_relative '../../scripts/index.rb'

describe 'Navigation' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
  end
  it 'assert navigation' do
    @landing.login()
    expect(@browser.url.include? '/login').to eql(true)
    @landing.go_to_landing()
    sleep 0.5
    expect(@browser.url).to eq(@base_url)
    @landing.signup_and_freetrial_login()
    sleep 5
    expect(@browser.url.include? '/signup').to eql(true)
    @landing.go_to_landing()
    expect(@browser.url).to eq(@base_url)
    @landing.go_to_about_us()
    sleep 0.5
    expect(@browser.url.include? '/about').to eql(true)
    @landing.go_to_landing()
    expect(@browser.url).to eq(@base_url)
    @landing.header_pricing_page()
    sleep 0.5
    expect(@browser.url.include? '/pricing').to eql(true)
    @landing.go_to_landing()
    expect(@browser.url).to eq(@base_url)
    @landing.header_concepts_page()
    sleep 0.5
    expect(@browser.url.include? '/concepts').to eql(true)
    @landing.go_to_landing()
    expect(@browser.url).to eq(@base_url)
  end
end
