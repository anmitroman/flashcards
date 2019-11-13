module Parser
  def self.parse_en365
    doc = Nokogiri::HTML(open('https://www.en365.ru/top1000.htm'))
    words = []
    date = Date.today + 3
    doc.xpath('//table/tbody/tr[position() > 1]').each do |word|
      words << [word.search('td[2]').text.strip, word.search('td[3]').text.strip, date]
    end
    words
  end
end
