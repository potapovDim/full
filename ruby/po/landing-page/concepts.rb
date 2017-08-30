class Concepts
  #initialize webdriver 
  def initialize(driver)
    @browser                            = driver
    @concept                            = 'img[alt="concept name"]'
    @start_your_website                 = 'button[title="Start website"]'
    @search_input                       = 'input.field__input'
    @concept_title                      = '.image-item__title'
    @concept_category_filter_button     = 'button.aside-menu__link'
    @concept_category_filter_item       = '.aside-menu__item'
    @magic_start_button                 = '.concept-item__btn.concept-item__btn_blue'
    @preview_concept                    = '.concept-item__btn.concept-item__btn_white'
    @active_concept_category            = '.aside-menu__item.flex.flex_align_center.light.active'
    #when 10 free concepts open modal
    @buy_grown_plan                     = '[data-test="Buy growth plan"]'
  end
   
  #method
  def start_magic(concept_index) #if use it for login case
    @browser.elements(css: '.concept-item__btns')[concept_index].a(text: 'Magic start').fire_event 'hover'
    @browser.elements(css: '.concept-item__btns')[concept_index].a(text: 'Magic start').fire_event 'click'
    return MagicStart.new @browser
  end
  #search concept by keys
  def search_concept_by_keys(keys)
    @browser.element(css: @search_input).send_keys keys
    return self
  end
  def assert_search(keys)
    concept_titles = @browser.elements(css: @concept_title) #get all titles
    for i in 0..concept_titles.length - 1 do # for all titles
      if !concept_titles[i].text.include? keys # if title not includes search keys end func 
        return false
      end
    end
    return self
  end
  # change filter concepts by category
  def concepts_all
    @browser.elements(css: @concept_category_filter_button)[0].click
    sleep 0.5
    return self
  end
  #get active concept filter text 
  def get_active_concept_filter_text
    active_tab_text = @browser.element(css: @active_concept_category).text
    return active_tab_text, self
  end
  #buy growth plan from 
  def go_to_growth_plan_from_modal
    @browser.element(css: @buy_grown_plan).fire_event 'click'
    return Plan.new @browser
  end
end
