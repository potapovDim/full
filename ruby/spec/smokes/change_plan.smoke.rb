require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Growth plan" ,:focus => true  do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end

  it "redirect to login" do
    @browser.goto @base_url+'plan'
    expect(@browser.url.include?('/login')).to eql(true)
    expect(@browser.url.include?('/plan')).to eql(false)
  end
  it "change growth plan" do
    plan_page_driver, price_value = @landing.login()
                                            .login_user(@username, @password)
                                            .buy_growth_plan()
                                            .choose_your_payment_method("annually")
    expect(price_value).to eql('$126')
    plan_page_after_change, price_value = plan_page_driver
                                            .choose_your_payment_method("monthly")
    expect(price_value).to eql('$15')
    plan_page_driver_after_next_change, price_value = plan_page_after_change
                                            .choose_your_payment_method("binnualy")
    expect(price_value).to eql('$198')
  end
end
