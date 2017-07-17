require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Login user" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end
  # fail part login
  it "failed login user" do
    el = @landing.login().fail_login_user[0]
    expect(el.present?).to eql(true)
  end
  it "get statrted (negative)" do
    el = @landing.get_started_login().fail_login_user[0]
    expect(el.present?).to eql(true)
  end
  it "sign up and start trial (negative)" do
    el = @landing.signup_and_freetrial_login().fail_login_user[0]
    expect(el.present?).to eql(true)
  end
  it "go concepts and succes login by fourth growth plan (negative)" do
    el = @landing
          .header_concepts_page()
          .go_to_login()
          .fail_login_user[0]
    expect(el.present?).to eql(true)
  end
  it "go pricing and login by first growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(0)
        .fail_login_user(" "<<@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it "go pricing and login by second growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(" "<<@username, @password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it "go pricing and login by second growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username," "<<@password)
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it "go pricing and login by second growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username,@password<<" ")
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it "go pricing and login by second growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username, " ")
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it "go pricing and login by second growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username, "------------------------------")
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  it "go pricing and login by second growth plan (negative)" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .fail_login_user(@username, "@#&*&Y$#*&^*$#")
    expect(@browser.url.include?('/myaccount/account/websites')).to eql(false)
  end
  #success part login
  it "sucess login user" do
    @landing.login().success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "get started (success login)" do
    @landing.get_started_login().success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "sign up and start trial (success login)" do
    @landing.signup_and_freetrial_login().success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing and success login by first growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(0)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing and success login by second growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(1)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing and success login by third growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(2)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing and success login by fourth growth plan" do
    @landing
        .header_pricing_page()
        .success_login_by_growth_plan(3)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  #concets header
  it "go concepts and success login by fourth growth plan" do
    @landing
        .header_concepts_page()
        .go_to_login()
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/website/create/')).to eql(true)
  end
  it "go pricing from footer and success login by first growth plan" do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(0)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing from footer and success login by second growth plan" do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(1)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing from footer and success login by third growth plan" do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(2)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go pricing from footer and success login by fourth growth plan" do
    @landing
        .go_to_footer()
        .pricing_page()
        .success_login_by_growth_plan(3)
        .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/websites')).to eql(true)
  end
  it "go to concept from fotter and login " do
    @landing
      .go_to_footer()
      .concepts_page()
      .go_to_login()
      .success_login_user(@username, @password)
    expect(@browser.url.include?('/myaccount/website/create/')).to eql(true)
  end
end
