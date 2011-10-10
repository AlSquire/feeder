require './spec/spec_helper'
require './feeder'
require 'nokogiri'

describe Feeder do
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

  before do
    Feeder.any_instance.stubs(:get_goodanime_index).returns('anything')
    GoodanimeParser.any_instance.stubs(:results).returns(expected_results)
  end

  it "respond to /goodanime.rss" do
    get '/goodanime.rss'

    last_response.ok?.must_equal true # Ugly, no predicate assertions with Minitest?
  end

  it "respond with the expected rss at /goodanime.rss" do
    get '/goodanime.rss'

    doc = Nokogiri::XML(last_response.body)

    doc.css('item').count.must_equal 4
    doc.css('item > title').map(&:content).must_equal expected_results.map { |r| r[:title] }
    doc.css('item > link').map(&:content).must_equal expected_results.map { |r| r[:link] }
    doc.css('item > guid').map(&:content).must_equal expected_results.map { |r| r[:guid] }
  end
end