require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Leftnav (site structure)" do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(2)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @left_nav = LeftNav.new @browser
  end
  it "add new page and delete page" do
    #add page part
    page_length_before, new_page = @left_nav
                                    .open_pages()
                                    .became_to_initial_structure()
                                    .create_new_page()
    page_length_after            =  new_page
                                    .enter_page_name('test')
                                    .enter_page_url('test')
                                    .add_page()
    sleep 2
    expect(page_length_before == page_length_after ).to be true
    #delete page part
    # before_pages, after_pages = @left_nav.open_pages()
    #                                      .delete_page(1)               
    # expect(before_pages != after_pages ).to be true
  end
end