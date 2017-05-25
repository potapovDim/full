require_relative "./editor-expired-period"

class Editor
  #initialize drivers
  @@browser
  def initialize(browser)
    @@browser = browser
    EditorExpiredPerion.initDriver browser
  end
  #go to browth plan if expired trial period
  def buy_growth_plan(from_top)
    if from_top
      EditorExpiredPerion.buy_a_growth_plan_for_current_website
    else
      EditorExpiredPerion.publish_button_click()
                         .buy_a_growth_plan_for_current_website_modal()
    end
  end
end
