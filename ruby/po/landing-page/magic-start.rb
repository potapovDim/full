class MagicStart
  def initialize(browser)
    @browser                          = browser
    @disable_all_blocks               = '.constructor__link.constructor__link_sm'
    @toggle_block                     = '.toggle__input'
    @preview_block_image              = '.constructor-preview__pic'
    @skip_magic_and_proceed_to_editor = '.constructor__link.constructor__link_md.constructor__link_underline'
    @breadcrumbs_link                 = '.breadcrumbs__link'
    @next_step                        = '.btn.btn_md.btn_blue.constructor__btn.constructor-footer__btn'
    @reroll_design                    = '.btn-circle'
    @site_name                        = '#site_name'
    @proceed_to_final_step            = '.btn.btn_md.btn_blue.btn_full.constructor__btn'
  end

  def back_from_step
    @browser.a(text: 'Back').fire_event 'click'
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
end
