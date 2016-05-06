

require 'selenium-webdriver'
require "selenium/client"
require 'csv'
require 'watir-scroll'
require 'watir-webdriver'
require 'webdriver-user-agent'
require 'writeexcel'

workbook = WriteExcel.new('oralbuk.xls')

worksheet  = workbook.add_worksheet

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'Firefox'
caps['browser_version'] = '46.0'
caps['os'] = 'OS X'
caps['os_version'] = 'Yosemite'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"
caps["browserstack.local"] = "true"
browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)
browser.window.maximize
counter=0
puts "Oralb test"
csv_text = File.read('uk_new.csv',encoding: "iso-8859-1:UTF-8")

csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"
#loc3= "#{row['type']}"
#loc4= "#{row['count']}"
sleep 1
counter+=1;
puts counter
puts loc1

browser.goto  loc1
#driver.scroll.to [0, 300]
#driver.goto loc1
sleep 1


worksheet.write(counter,1, loc1)
worksheet.write(counter,2 ,browser.title)


browser.screenshot.save counter.to_s<<".png"




sleep 1


end

workbook.close