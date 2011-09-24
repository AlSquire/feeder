require 'test_helper'
require './feeder'
require 'nokogiri'

class FeederTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Feeder
  end

  def expected_results
    [
      { :title => "One anime",   :link => "http://example.com/one_anime.html",   :guid => "one_anime" },
      { :title => "Other anime", :link => "http://example.com/other_anime.html", :guid => "other_anime" },
      { :title => "Third anime", :link => "http://example.com/third_anime.html", :guid => "third_anime" }
    ]
  end

  def setup
    Feeder.any_instance.stubs(:get_goodanime_index).returns('anything')
    GoodanimeParser.any_instance.stubs(:results).returns(expected_results)
  end

  def test_goodanime_respond
    get '/goodanime.rss'

    assert last_response.ok?
  end

  def test_goodanime_serve_the_rss_feed
    get '/goodanime.rss'

    doc = Nokogiri::XML(last_response.body)
    assert_equal 3, doc.css('item').count
    assert_equal expected_results.map { |r| r[:title] }, doc.css('item > title').map(&:content)
    assert_equal expected_results.map { |r| r[:link] },  doc.css('item > link').map(&:content)
    assert_equal expected_results.map { |r| r[:guid] },  doc.css('item > guid').map(&:content)
  end
end