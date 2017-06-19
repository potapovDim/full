class Editor

  #initialize drivers
  @@browser
  def initialize(browser)
    @@browser = browser
    EditorExpiredPerionAndPublish.initDriver browser
  end
  #go to browth plan if expired trial period
  def buy_growth_plan(from_top)
    if from_top
      EditorExpiredPerionAndPublish.buy_a_growth_plan_for_current_website
    else
      EditorExpiredPerionAndPublish.publish_button_click()
                                   .buy_a_growth_plan_for_current_website_modal()
    end
  end
  def publish_website
    EditorExpiredPerionAndPublish.publish_button_click()
                                 .submit_publish()
                                 .close_publishing_modal()
                                 .get_publishing_process()
  end 
  def open_modal_in_publish_proccess
    EditorExpiredPerionAndPublish.publish_button_click()
  end
  def editor_mode_change
    return EditorExpiredPerionAndPublish
  end
end
