puts '### Search for nodes by xpath'
data = Parser.parse_en365
puts data
data.each do |word|
  puts "#{word[0]} - added to database"
  Card.create(original_text: word[0], translated_text: word[1], review_date: word[2])
end
