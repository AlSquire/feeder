require 'sinatra'
require 'open-uri'
require 'builder'
require './goodanime_parser'

class Feeder < Sinatra::Application
  get '/goodanime.rss' do
    @results = GoodanimeParser.new(get_goodanime_index).results
    builder :goodanime
  end

  def get_goodanime_index
    open('http://goodanime.net/')
  end
end