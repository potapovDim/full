class MagicStart
  def initialize(browser)
    @browser                          = browser
    @disable_all_blocks               = '.constructor__link.constructor__link_sm'
    @disable_block_status             = '.toggle__input'
    @toggle_disable_block             = '.toggle__label'
    @preview_block_image              = '.constructor-preview__pic'
    @skip_magic_and_proceed_to_editor = '.constructor__link.constructor__link_md.constructor__link_underline'
    @breadcrumbs_link                 = '.breadcrumbs__link'
    @next_step                        = '.btn.btn_md.btn_blue.constructor__btn.constructor-footer__btn'
    @reroll_design                    = '.btn-circle'
    @site_name                        = '#site_name'
    @proceed_to_final_step            = '.btn.btn_md.btn_blue.btn_full.constructor__btn'
    @info                             = '.plan.plan_offset'
  end

  def back_from_step
    @browser.a(text: 'Back').fire_event 'click'
    return self
  end

  def disable_all_blocks
    @browser.element(css: @disable_all_blocks).fire_event 'click'
    sleep 1
    return self
  end

  def disable_enable_block(index)
    @browser.element(css: @toggle_disable_block).fire_event 'click'
    sleep 1
    return self
  end

  def next_step
    @browser.element(css: @next_step).fire_event 'click'
    return self
  end

  def rerelol_design_all_blocks
    @browser.elements(css: @reroll_design)[0].fire_event 'click'
    return self
  end

  def get_login
    return Login.new @browser
  end

  def get_all_blocks_checkbox_status
    status = nil
    for i in 0..@browser.checkboxes(css: @disable_block_status).length-1 do
      if !@browser.checkboxes(css: @disable_block_status)[i].checked?
        status = false
      else
        return true
      end
    end
    return status
  end
end
