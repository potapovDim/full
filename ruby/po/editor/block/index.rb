require_relative "./paddings"
require_relative "./context-panel"

class Block
  include PaddingsBlock
  include ContextPanelBlock
  #initialize drivers
  @@browser
  def initialize(browser, block_target = 0)
    @@block_background        = '[data-test="block-component"]>div>div:nth-child(1)>div>div'
    @@browser                 = browser
    @@block_target            = block_target
    ContextPanelBlock.initDriver browser
  end
  #paddings api
  def resize_padding()
    return PaddingsBlock.initDriver @@browser
  end
  #block context panel api
  def click_block_context (button)
    case button
      when "remove"
        ContextPanelBlock.block_remove(@@block_target)
      when "duplicate"
        ContextPanelBlock.block_duplicate(@@block_target)
      when "settings"
        ContextPanelBlock.open_block_settings(@@block_target)
    end
  end
  def get_block_background
    return @@browser.elements(css: @@block_background)[@@block_target].style 'background'
  end
end
