require 'nokogiri'

class GoodanimeParser
  attr_accessor :html_source, :results

  def initialize(html)
    self.html_source = html
    parse
  end

private
  def parse
    doc = Nokogiri::HTML(html_source)
    self.results = doc.css('div#page div.post table td:first-child ul li').inject([]) do |memo, li|
      title = li.css('a').first.content.strip
      state = li.css('font').first.content
      memo << [title, state].join(' ')
    end
  end
end