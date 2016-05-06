

require 'selenium-webdriver'
require "selenium/client"
require 'csv'
require 'watir-scroll'
require 'watir-webdriver'
require 'webdriver-user-agent'
require 'writeexcel'

workbook = WriteExcel.new('oralbuk.xls')

worksheet  = workbook.add_worksheet

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.android 
caps["client"] = "Selenium::WebDriver::Remote::Http::Default.new"
caps['acceptSslCerts'] = 'true'
driver = Selenium::WebDriver.for(:remote,
  :url => "http://localhost:8080/wd/hub/",
  :desired_capabilities => caps)
driver.navigate.to "https://author.oralb.pgsitecore.com"
browser = Watir::Browser.new driver

counter=183
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


driver.save_screenshot  counter.to_s<<".png"




sleep 1


end

workbook.close