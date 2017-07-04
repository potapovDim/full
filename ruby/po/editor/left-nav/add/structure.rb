module StructurePart
  #left nav add structure catalogue
  #css selectors
  #@row = '[data-test="thumbnail-image"]'
  #initialize browser
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #apps left nav methods
  def self.add_structure_from_catalogue(x, y, element="text")
    return self
  end
end