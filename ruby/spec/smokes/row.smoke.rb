require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Row component" do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url

    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(2)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @row = Row.new(@browser, 0)
    @row.click_row_context('settings')
        .choose_tab("background")
        .change_background_type("none")
    @browser.send_keys :escape
  end
  it "change row background (color)" do
    initial_background = @row.get_row_background
    @row.click_row_context('settings')
        .choose_tab("background")
        .change_background_type("color")
    @browser.send_keys :escape
    changed_background = @row.get_row_background
    expect(changed_background).to_not eql(initial_background)
  end
  it "change row background (gradient)" do
    initial_background = @row.get_row_background
    @row.click_row_context('settings')
        .choose_tab("background")
        .change_background_type("gradient")
    @browser.send_keys :escape
    changed_background = @row.get_row_background
    expect(changed_background).to_not eql(initial_background)
  end
end
