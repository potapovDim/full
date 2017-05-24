require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Growth plan" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end

  it "redirect to login" do
    @browser.goto @base_url+'plan'
    expect(@browser.url.include?('/login')).to eql(true)
    expect(@browser.url.include?('/plan')).to eql(false)
  end
  it "change growth plan (top panel button)" do
    plan_page_driver, price_value = @landing.login()
                                            .login_user(@username_expired, @password_expired)
                                            .buy_growth_plan()
                                            .choose_your_payment_method("annually")
    expect(price_value).to eql('$126')
    plan_page_after_change, price_value = plan_page_driver
                                            .choose_your_payment_method("monthly")
    expect(price_value).to eql('$15')
    plan_page_driver_after_next_change, price_value = plan_page_after_change
                                            .choose_your_payment_method("binnualy")
    expect(price_value).to eql('$198')
    page, error_value = plan_page_driver_after_next_change
                                            .enter_promocode_fail(" ;")
    expect(error_value).to eql('You have entered a wrong code')
    page_after_error, error_value = page
                                            .enter_promocode_fail("dsakdkljsajdlaskl")
    expect(error_value).to eql('You have entered a wrong code')
  end
  it "chage growth plan (modal message button)" , :focus => true do
    plan_page_driver, price_value = @landing.login()
                                            .login_user(@username_expired, @password_expired)
                                            .go_to_my_websites()
                                            .go_to_buy_growth_plan_modal()
                                            .choose_your_payment_method("annually")
    expect(price_value).to eql('$126')
    plan_page_after_change, price_value = plan_page_driver
                                            .choose_your_payment_method("monthly")
    expect(price_value).to eql('$15')
    plan_page_driver_after_next_change, price_value = plan_page_after_change
                                            .choose_your_payment_method("binnualy")
    expect(price_value).to eql('$198')
    page, error_value = plan_page_driver_after_next_change
                                            .enter_promocode_fail(" ;")
    expect(error_value).to eql('You have entered a wrong code')
    page_after_error, error_value = page
                                            .enter_promocode_fail("dsakdkljsajdlaskl")
    expect(error_value).to eql('You have entered a wrong code')
  end
end
