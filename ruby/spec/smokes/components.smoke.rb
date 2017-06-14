require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Components align" , :focus => true  do
  before :each do
    @browser.window.resize_to  1600, 1200
    @browser.goto @base_url
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(2)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @icon = Icon.new @browser
    @image = Image.new @browser
    @icon = Line.new @browser
    @text = Text.new @browser
    @button = Button.new @browser
    sleep 7
  end
  it "change button align" do
    @button.focus_element
    @button.context_panel_action("align center")
        .click_context_item("align left")
        .click_context_item("align right")
        .click_context_item("align left")
        .click_context_item("align center")
  end
  it "change icon align" do
    @icon.focus_element
    @icon.context_panel_action("align center")
        .click_context_item("align left")
        .click_context_item("align right")
        .click_context_item("align left")
        .click_context_item("align center")
  end
  it "change image align" do
    @image.focus_element
    @image.context_panel_action("align center")
        .click_context_item("align left")
        .click_context_item("align right")
        .click_context_item("align left")
        .click_context_item("align center")
  end
  it "change button align" do
    @button.focus_element()
    @button.context_panel_action("align center")
        .click_context_item("align left")
        .click_context_item("align right")
        .click_context_item("align left")
        .click_context_item("align center")
  end
  it "change text align" do
    @text.focus_element()
    @text.context_panel_action("align center")
        .click_context_item("align left")
        .click_context_item("align right")
        .click_context_item("align left")
        .click_context_item("align center")
  end
end
