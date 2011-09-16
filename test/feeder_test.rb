require 'test_helper'
require './feeder'

class FeederTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Feeder
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World Warrior', last_response.body
  end

  def test_it_says_hello_to_a_person
    get '/', :name => 'Simon'
    assert last_response.body.include?('Simon')
  end
end