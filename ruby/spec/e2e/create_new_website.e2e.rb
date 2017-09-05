require_relative '../../scripts/index.rb'

describe 'Create new website from concept' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
  end
  it 'create' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    expect(start_magic.get_all_blocks_checkbox_status(true)).to eql(true)
    start_magic.disable_all_blocks()
    expect(start_magic.get_all_blocks_checkbox_status(false)).to eql(true)
    start_magic.disable_enable_block(0)
    expect(start_magic.get_checkbox_status(0)).to eql(true)
    start_magic.next_step()
    start_magic.play_with_design_present()
    start_magic.next_step()
    start_magic.almost_done_present()
    start_magic.set_site_name()
    expect(start_magic.get_site_name).to eql("test_site")
    start_magic.final_step()
  end
  it 'skip magic start' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.skip_magic
    start_magic.almost_done_present()
  end
  it 'breadcrumbs go to concepts' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.go_to_consepts_page(0)
    expect(@browser.url).to eql(@base_url + "concepts")
  end
  it 'breadcrumbs go to concept category' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.go_to_consepts_page(1)
    expect(@browser.url).to eql(@base_url + "concepts/beautyandfashion")
  end
end
