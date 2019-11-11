doc = Nokogiri::HTML(open('https://www.en365.ru/top1000.htm'))
puts '### Search for nodes by xpath'
doc.xpath('//table/tbody/tr[position() > 1]').each do |word|
  doc_original_text = word.search('td[2]').text.strip
  doc_translated_text = word.search('td[3]').text.strip
  date = Date.today + 3
  puts "#{doc_original_text} - added to database"
  Card.create(original_text: doc_original_text, translated_text: doc_translated_text, review_date: date)
end
