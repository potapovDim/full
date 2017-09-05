require_relative "./elements"
require_relative "./built-in-apps"

class Add
  #browser instance
  @browser
  def initialize (browser)
    @browser = browser  
  end
  #api methods
  def add_elements
    return ElementsPart.new @browser
  end

  def add_apps
    return BuiltInAppsPart.new @browser
  end
end