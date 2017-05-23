require_relative './login'

module Concepts
  #concepts selectors
  @concept                            = 'img[alt="concept name"]'
  @start_your_website                 = 'button[title="Start website"]'
  @search_input                       = 'input.field__input'
  @concept_title                      = '.image-item__title'
  @concept_category_filter_button     = 'button.aside-menu__link'
  @concept_category_filter_item       = '.aside-menu__item'
  @active_concept_category            = '.aside-menu__item.flex.flex_align_center.light.active'
  #initialize webdriver 
  def self.initDriver(driver)
    @Login = Login.initDriver driver
    @browser = driver
    return self
  end
  
  #method
  def self.go_to_login
    @browser.elements(css: @concept)[0].fire_event 'hover'
    @browser.element(css: @start_your_website).fire_event 'click'
    return @Login
  end
  #search concept by keys
  def self.search_concept_by_keys(keys)
    @browser.element(css: @search_input).send_keys keys
    return self
  end
  def self.assert_search(keys)
    concept_titles = @browser.elements(css: @concept_title) #get all titles
    for i in 0..concept_title.length do # for all titles
      if !concept_title[i].text.include? keys # if title not includes search keys end func 
        return false
      end
    end
    return self
  end
  # change filter concepts by category
  def self.concepts_all
    @browser.elements(css: @concept_category_filter_button)[0].click
    return self
  end
  def self.concepts_blogs
    @browser.elements(css: @concept_category_filter_button)[1].click
    #@browser.element(text: 'Blogs').click
    return self
  end
  def self.concepts_businesses
    @browser.elements(css: @concept_category_filter_button)[2].click
    #@browser.element(text: 'Businesses').click
    return self
  end
  def self.concepts_musicians
    @browser.elements(css: @concept_category_filter_button)[3].click
    #@browser.element(text: 'Musicians').click
    return self
  end
  def self.concepts_personal
    @browser.elements(css: @concept_category_filter_button)[4].click
    #@browser.element(text: 'Personal').click
    return self
  end
  def self.concepts_portfolios
    @browser.elements(css: @concept_category_filter_button)[5].click
    # @browser.element(text: 'Portfolios').click
    return self
  end
  def self.concepts_restaurants
    @browser.elements(css: @concept_category_filter_button)[6].click
    #@browser.element(text: 'Restaurants').click
    return self
  end
  def self.concepts_wedding
    @browser.elements(css: @concept_category_filter_button)[7].click
    #@browser.element(text: 'Wedding').click
    return self
  end
  #get active concept filter text 
  def self.get_active_concept_filter_text
    active_tab_text = @browser.element(css: @active_concept_category).text
    return self, active_tab_text
  end
end
