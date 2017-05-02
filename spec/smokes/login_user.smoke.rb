require_relative '../../scripts/local.rb'

describe "Login user" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end
  #fail part login
  it "failed login user" do
    el = @landing.login().fail_login_user
    expect(el.present?).to eql(true)
  end
  it "get statrted (failed login)" do
    el = @landing.get_started_login().fail_login_user
    expect(el.present?).to eql(true)
  end
  it "sign up and start trial (failed login)" do
    el = @landing.signup_and_freetrial_login().fail_login_user
    expect(el.present?).to eql(true)
  end
  it "go concepts and succes login by fourth growth plan" do
    el = @landing
          .header_concepts_page()
          .go_to_login()
          .fail_login_user
    expect(el.present?).to eql(true)
  end
  #success part login
  it "sucess login user" do
    @landing.login().login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "get started (success login)" do
    @landing.get_started_login().login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "sign up and start trial (success login)" do
    @landing.signup_and_freetrial_login().login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "go pricing and succes login by first growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(0)
        .login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "go pricing and succes login by second growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "go pricing and succes login by third growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(2)
        .login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  it "go pricing and succes login by fourth growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(3)
        .login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
  #concets header
  it "go concepts and succes login by fourth growth plan" do
    @landing
        .header_concepts_page()
        .go_to_login()
        .login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(true)
  end
end
