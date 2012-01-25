require 'rest_client'
require 'selenium-webdriver'

# to run this script headless install xvfb
# Xvfb :99 -ac &
# export DISPLAY=:99
post '/' do
  begin
    puts params.inspect
    rc = RestClient.post(
      'http://images.google.com/searchbyimage/upload',
      :image_url => '',
      :encoded_image => '~/Desktop/8856_1003-h.jpg', # params['file'][:tempfile],
      :filename => '8856_1003-h.jpg', #params['file'][:filename],
      :image_content => '',
      :hl => 'de',
      :biw => 1916,
      :bih => 437
    ) {|response, request, result| response }
    url = rc.match(/(?<=HREF=\")http.*(?=\")/)[0]
    image_name = get_image_name "#{url}&hl=de"
    puts image_name
    image_name
  rescue
    puts ':('
    'FFFFFF-'
  end
end

def get_image_name url
  driver = Selenium::WebDriver.for :firefox
  driver.navigate.to url
  element = driver.find_element :id => 'topstuff'
  txt = element.text
  driver.close
  txt.match(/(?<=dieses\sBild\:\s).*/)[0]
end
