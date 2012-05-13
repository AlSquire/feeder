require 'minitest/spec'
require 'minitest/autorun'
require 'rack/test'
require 'open-uri'
require 'nokogiri'
require 'mocha'
require 'vcr'

ENV['RACK_ENV'] = 'test'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end