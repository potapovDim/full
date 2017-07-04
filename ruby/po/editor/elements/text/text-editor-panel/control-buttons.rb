require_relative "../../../share/color-picker"

module ControlButtons
  include ColorPicker
  #css slectors
  @control_selector = '[data-test="button-control-text-panel"]>button'
  #initialize browser
  @browser
  def self.initDriver(browser)
    @browser = browser
    return self
  end
  #api methods
  def self.change_text_view(control="b")
    controls = @browser.elements(css: @control_selector)
    case control
      when "paste" #paste 
        controls[0].click
      when "cut" #cut part of text
        controls[1].click
      when "copy" #copy part of text
        controls[2].click
      when "fonts" #font list modal open
        controls[3].click
      when "b" #bold text
        controls[4].click
      when "i" # italic text
        controls[5].click
      when "u" #underline
        controls[6].click
      when "s" #with line
        controls[7].click
      when "x" #to sqrt
        controls[8].click
      when "left" #align text left
        controls[9].click
      when "center" #align text center
        controls[10].click
      when "right" #align text right
        controls[11].click
      when "full" #align text to full
        controls[12].click
      when "link" #add link to text
        controls[13].click
      when "unlink" #remove links from text
        controls[14].click
      when "font color" #change font color 
        controls[15].click 
        return ColorPicker.initDriver @browser
      when "background color" #change font background color  
        controls[16].click
        return ColorPicker.initDriver @browser
      when "clear" #clear all text styles
        controls[17].click
      when "undo" #text undo (previous view)
        controls[18].click
      when "redo" #text redo (next view)
        controls[19].click
    end
    return self
  end
end