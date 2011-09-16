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
      "One anime",
      "Other anime",
      "Third anime"
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
    assert_equal expected_results, doc.css('item > title').map(&:content)
  end
end