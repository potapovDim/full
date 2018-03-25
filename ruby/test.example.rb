require 'watir'
require 'phashion'

b = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --headless]
b.goto 'https://weblium.com'
Dir::mkdir('screenshots') if not File.directory?('screenshots')
screenshot_prod = "./screenshots/prod.png"
b.driver.save_screenshot(screenshot_prod)
puts b.title


b.goto 'https://weblium.co'
sleep 1.5
screenshot_stage = "./screenshots/stage.png"
b.driver.save_screenshot(screenshot_stage)

b.close

img1 = Phashion::Image.new(screenshot_prod)
img2 = Phashion::Image.new(screenshot_stage)

print img1.duplicate?(img2)