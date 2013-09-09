source 'http://rubygems.org'

ruby '2.0.0' unless ENV['TRAVIS']

gem 'sinatra'
gem 'nokogiri'
gem 'builder'
gem 'rake'

group :production do
  gem 'thin'
end

group :development, :test do
  gem 'minitest'
  gem 'rack-test'
  gem 'guard-minitest'
  gem 'mocha'
  # For Mac OS X love
  gem 'growl'
  gem 'rb-fsevent'
  gem 'webmock'
  gem 'vcr'
end