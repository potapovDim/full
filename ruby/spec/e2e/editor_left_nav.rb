require_relative '../../scripts/local'
require_relative '../../helpers/index'
# , :focus => true if need run only this suit
describe 'Editor leftnav' do
  before :each do
    clear_useless_user_pages(@username, @password)
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
    @landing.login()
            .success_login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(0)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @left_nav = LeftNav.new @browser
  end
  it 'add new page' do
    #add page part
    site_structure = @left_nav.open_site_structure()
    page_length_before = site_structure.get_pages_length()
    site_structure.create_new_page()
                  .enter_page_name('test')
                  .enter_page_url('test')
                  .add_page()
    @left_nav.open_site_structure()
    page_length_after = site_structure.get_pages_length()
    expect(page_length_before != page_length_after ).to be true
    expect(page_length_before == page_length_after - 1 ).to be true
  end
end