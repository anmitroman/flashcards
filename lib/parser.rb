module Parser
  def self.parse_en365
    doc = Nokogiri::HTML(open('https://www.en365.ru/top1000.htm'))
    words = []
    date = Date.today + 3
    doc.xpath('//table/tbody/tr[position() > 1]').each do |word|
      original_text = word.search('td[2]').text.strip
      to_index = original_text.index('[')
      original_text = original_text[0, to_index - 1]
      words << [original_text.strip, word.search('td[3]').text.strip, date]
    end
    words
  end
end
