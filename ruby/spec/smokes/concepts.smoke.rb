require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Concepts" , :focus => true do
  before :each do
    @browser.window.resize_to 1200, 1600
    @browser.goto @base_url
  end

  it "filter concepts by category" do
    concepts_page, active_filter = @landing.header_concepts_page()
                                           .concepts_all()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'All').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_blogs()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Blogs').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_businesses()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Businesses').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_musicians()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Musicians').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_personal()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Personal').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_portfolios()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Portfolios').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_restaurants()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Restaurants').to eql(true)
    concepts_page, active_filter = concepts_page
                                           .concepts_wedding()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Wedding').to eql(true)
  end
end
