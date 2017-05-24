module BuiltInAppsPart
  #left nav add elements catalogue
  #css selectors
  @social_icons = '[data-test="thumbnail-social-icons"]'
  @social_share = '[data-test="thumbnail-social-share"]'
  @contact_form = '[data-test="thumbnail-contact-form"]'
  @map = '[data-test="thumbnail-map"]'
  @video = '[data-test="thumbnail-video"]'
  @image_gallery = '[data-test="thumbnail-image-gallery"]'
  #initialize browser
  @browser
  def self.initBrowser(browser)
    @browser = browser
    return self
  end
  #elements left nav methods
  def self.add_app_from_catalogue(x, y, app="map")
    case element
      when "map"
        @browser.element(css: @map).hover
        @browser.element(css: @map).drag_and_drop_by x, y
      when "icons"
        @browser.element(css: @social_icons).hover
        @browser.element(css: @social_icons).drag_and_drop_by x, y
      when "share"
        @browser.element(css: @social_share).hover
        @browser.element(css: @social_share).drag_and_drop_by x, y
      when "form"
        @browser.element(css: @contact_form).hover
        @browser.element(css: @contact_form).drag_and_drop_by x, y
      when "video"
        @browser.element(css: @video).hover
        @browser.element(css: @video).drag_and_drop_by x, y
      when "gallery"
        @browser.element(css: @image_gallery).hover
        @browser.element(css: @image_gallery).drag_and_drop_by x, y
    end
    return self
  end
end