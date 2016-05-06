

require 'selenium-webdriver'
require "selenium/client"
require 'csv'
require 'watir-scroll'
require 'watir-webdriver'
require 'webdriver-user-agent'
require 'writeexcel'

workbook = WriteExcel.new('oralbuk.xls')

worksheet  = workbook.add_worksheet

browser = Watir::Browser.new :firefox

counter=0
puts "Oralb test"
csv_text = File.read('cascade301.csv',encoding: "iso-8859-1:UTF-8")

csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['old']}"
loc2= "#{row['new']}"
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



puts "Found a  mismatch " <<temp<< " & "<< loc2
worksheet.write(counter,1, loc1)
worksheet.write(counter,2 ,browser.title)







sleep 1


end

workbook.close