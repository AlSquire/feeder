xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Feeder: Goodanime"
    xml.link "http://goodanime.net"

    @results.each do |item|
      xml.item do
        xml.title item
      end
    end
  end
end