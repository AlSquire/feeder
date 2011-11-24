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
    self.results = doc.css('div#page div.post table td:first-child ul li').map do |li|
      title = li.css('a').first.content.strip
      link  = li.css('a').first.attr(:href)
      state = li.css('font').first.content
      guid  = URI.parse(link).path[1..-1] + "-" + state.match(/^\((.*)\)$/)[1].downcase

      { :title => "#{title} #{state}", :link => link, :guid => guid }
    end
  end
end