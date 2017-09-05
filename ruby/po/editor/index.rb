class Editor
  def initialize(browser)
    @@browser = browser
    @@EditorTopNav = EditorTopNav.new browser
  end
  #go to browth plan if expired trial period
  def buy_growth_plan(from_top)
    if from_top
      @@EditorTopNav.buy_a_growth_plan_for_current_website
    else
      @@EditorTopNav.publish_button_click()
                                   .buy_a_growth_plan_for_current_website_modal()
    end
  end
  def publish_website
    @@EditorTopNav.publish_button_click()
                                 .submit_publish()
                                 .close_publishing_modal()
                                 .get_publishing_process()
  end
  def open_publis_window_and_close
    @@EditorTopNav.publish_button_click()
                                 .cancel_publish()
  end
  def open_modal_in_publish_proccess
    @@EditorTopNav.publish_button_click()
  end
  def get_top_nav_instance
    return EditorTopNav
  end
end
