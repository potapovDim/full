require_relative '../../scripts/index.rb'

describe 'Create new website from concept' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
  end
  it 'create' do
    start_magic = @landing.header_concepts_page().start_magic(1)
    start_magic.disable_all_blocks()
    expect(start_magic.get_all_blocks_checkbox_status()).to eql(false)
    start_magic.disable_enable_block(1)
    expect(start_magic.get_all_blocks_checkbox_status()).to eql(true)
    start_magic.next_step()
    expect(start_magic.play_with_design_present()).to eql(true)
    start_magic.next_step()
    expect(start_magic.almost_done_present()).to eql(true)
  end
end
