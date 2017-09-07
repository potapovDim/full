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
  it 'assert footer link exists' do
    @footer = Footer.new(@browser)
    @footer.go_to_pricing_page
    expect(@browser.url.include? '/pricing').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_concepts_page
    expect(@browser.url.include? '/concepts').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_about
    expect(@browser.url.include? '/about').to eql(true)
    @browser.goto @base_url

    @footer.go_to_blog
    @browser.driver.switch_to.window(@browser.driver.window_handles[1])
    expect(@browser.url.include? 'http://blog.weblium.com/').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_facebook
    @browser.driver.switch_to.window(@browser.driver.window_handles[2])
    expect(@browser.url.include? 'www.facebook.com/weblium/').to eql(true)
    @browser.goto @base_url 
    
    @footer.go_to_twitter
    @browser.driver.switch_to.window(@browser.driver.window_handles[3])
    expect(@browser.url.include? 'twitter.com/Weblium').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_linkedin
    @browser.driver.switch_to.window(@browser.driver.window_handles[4])    
    expect(@browser.url.include? 'www.linkedin.com').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_support_center
    expect(@browser.url.include? 'https://weblium.zendesk.com').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_privacy_policy
    expect(@browser.url.include? '/policy').to eql(true)
    @browser.goto @base_url 

    @footer.go_to_terms_of_use
    expect(@browser.url.include? '/terms').to eql(true)
    @browser.goto @base_url 
  end
end
