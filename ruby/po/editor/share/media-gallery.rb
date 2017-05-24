module MediaGallery
  #css selectors
  @image_title                  = 'input#title'
  @description                  = 'textarea'
  @change_image_button          = 'button[title="Change image"]'
  @remove_image                 = 'button[title="Remove image"]'
  #search input and search button
  @search_input                 = '[placeholder="Search photos"]'
  @search_button                = 'button[title="Search"]'
  #images collection 
  @unsplash_img                 = '.scrollarea-content.scrollBar__content img'
  #buttons for scroll and add image to own MediaGallery
  # @uploading = @browser.div(text: 'Uploading')
  # @uploaded = @browser.div(text: 'Uploaded')
  #imageItem_1-Z - image instance
  #initialize browser
  @browser
  def self.initBrowser(browser)
    @browser = browser
    return self
  end
  #tabs 
  def self.select_tab(tab="my images")
    tabs = @browser.elements(css: '.item_2-e')
    case tab
      when "my images"
        tabs[0].click
      when "free photos"
        tabs[1].click
      when "help"
        tabs[2].click
    end
    return self
  end
  #search input and button
  def self.search_free_photo(search_value)
    @browser.element(css: @search_input).send_keys search_value
    @browser.element(css: @search_button).click
    return self
  end

  def self.choose_background_image(im_number=0)
    @browser.elements(css: @unsplash_img)[im_number].click
    @browser.div(text: 'Add').click
    @browser.wait_until {@browser.div(text: 'Uploading').present?}
    self.select_tab
    @browser.element(css: @change_image_button).click
    return self
  end
end