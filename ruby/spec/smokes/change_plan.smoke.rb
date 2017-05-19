require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Login user" ,:focus => true  do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end

  it "expect redirect to login" do
    @browser.goto @base_url+'plan'
    expect(@browser.url.include?('/login')).to eql(true)
    expect(@browser.url.include?('/plan')).to eql(false)
  end
end
