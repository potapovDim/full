require_relative '../../scripts/local.rb'

describe "Login user" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto "https://weblium.co/"    
  end
  it "sucess login user" do
    @landing.login().login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "failed login user" do
    el = @landing.login().fail_login_user
    expect(el.present?).to eql(true)
  end
end



