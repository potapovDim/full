class MediaGallery
  #css selectors
  #buttons for scroll and add image to own MediaGallery
  # @uploading = @browser.div(text: 'Uploading')
  # @uploaded = @browser.div(text: 'Uploaded')
  #imageItem_1-Z - image instance
  #initialize browser
  @browser
  def initialize(browser)
    @image_title                  = 'input#title'
    @description                  = 'textarea'
    @change_image_button          = 'button[title="Change image"]'
    @remove_image                 = 'button[title="Remove image"]'
    #search input and search button
    @search_input                 = '[placeholder="Search photos"]'
    @search_button                = 'button[title="Search"]'
    #images collection 
    @unsplash_img                 = '.imageItem_1-Z9K.unsplash_1lZxI'
    @image_thumbnail              = '.imageItem_1-Z9K>div>div>div'
    @browser = browser
  end
  #tabs 
  def select_tab(tab="my images")
    tabs = @browser.elements(css: '.item_2-ePA')
    case tab
      when "my images"
        tabs[0].click
      when "free photos"
        tabs[1].click
      # when "help"
      #   tabs[2].click
    end
    return self
  end
  def choose_image(i=0)
    @browser.elements(css: @image_thumbnail)[i].fire_event 'click'
    return self
  end
  def change_image()
    @browser.element(css: @change_image_button).click
  end
  #search input and button
  def search_free_photo(search_value)
    @browser.element(css: @search_input).send_keys search_value
    @browser.element(css: @search_button).click
    return self
  end
  
  def choose_background_image(im_number=0)
    @browser.elements(css: @unsplash_img)[im_number].fire_event 'click'
    @browser.div(text: 'Add').click
    @browser.wait_until {@browser.div(text: 'Uploaded').present?}
    select_tab()
    choose_image(0)
    @browser.element(css: @change_image_button).click
    return self
  end
end