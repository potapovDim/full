require_relative "./paddings"
require_relative "./context-panel"

class Block
  include PaddingsBlock
  include ContextPanelBlock
  #initialize drivers
  @@browser
  def initialize(browser)
    @@browser = browser
    ContextPanelBlock.initBrowser browser
  end
  #paddings api
  def resize_padding()
    return PaddingsBlock.initBrowser @@browser
  end
  #block context panel api
  def click_block_context (button, index = 0)
    case button
      when "remove"
        ContextPanelBlock.block_remove(index)
      when "duplicate"
        ContextPanelBlock.block_duplicate(index)
      when "settings"
        ContextPanelBlock.open_block_settings(index)
    end
  end
end
