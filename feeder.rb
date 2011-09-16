require 'sinatra'

class Feeder < Sinatra::Application
  get '/' do
    "Hello World Warrior#{params[:name]}".strip
  end
end