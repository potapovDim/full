require_relative '../../scripts/index.rb'
require_relative '../../helpers/index'

# , :focus => true if need run only this suit
describe 'Demo' do
  before :each do
    @browser.window.resize_to 1600, 1200
  end
  #test case coverage <54>

  it 'go to sign up' do
    # concepts_ids = get_published_concepts()
    # concepts_ids.each do |id|
    #   @browser.goto @base_url+'editor/demo/website/'+id
    #   expect(@browser.element(css: '[title="Start my website"]').present?).to eql(true)
    #   @browser.element(css: '[title="Start my website"]').fire_event 'click'
    #   expect(@browser.url.include?('/signup?conceptId='+id)).to eql(true)
    # end
  end
end
