class StructurePart
  #left nav add structure catalogue
  #css selectors
  #@row = '[data-test="thumbnail-image"]'
  #initialize browser
  def initialize(browser)
    @browser = browser
  end
  #apps left nav methods
  def add_structure_from_catalogue(x, y, element="text")
    return self
  end
end