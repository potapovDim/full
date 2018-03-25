require_relative '../../scripts/index.rb'

# , :focus => true if need run only this suit
describe 'Concepts' do
  before :each do
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
  end
  #test case coverage <51 52 53>
  it 'filter concepts by category' do
    active_filter, concepts_page = @landing.header_concepts_page()
                                           .concepts_all()
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'All').to eql(true)

    active_filter, concepts_page = concepts_page
                                           .choose_category("Beauty & Fashion")
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Beauty & Fashion').to eql(true)

    active_filter, concepts_page = concepts_page
                                           .choose_category("Business")
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Business').to eql(true)

    active_filter, concepts_page = concepts_page
                                           .choose_category("Finance & Law")
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Finance & Law').to eql(true)

    active_filter, concepts_page = concepts_page
                                           .choose_category("Healthcare")
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Healthcare').to eql(true)

    active_filter, concepts_page = concepts_page
                                           .choose_category("Photo")
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Photo').to eql(true)
    active_filter, concepts_page = concepts_page
                                           .choose_category("Restaurants")
                                           .get_active_concept_filter_text()
    expect(active_filter.include? 'Restaurants').to eql(true)
  end
  it 'filter concepts by key word' do
    concepts_page, result = @landing.header_concepts_page()
                                    .search_concept_by_keys('law')
                                    .assert_search('law')
    expect(result).not_to eql(false)
  end
end
