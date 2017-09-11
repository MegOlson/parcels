require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/parcel'

get('/') do
  erb(:input)
end

get('/output') do
  length = params["length"].to_i
  width = params["width"].to_i
  height = params["height"].to_i
  weight = params["weight"].to_i
  shipping = params["shipping"]
  parcel = Parcel.new(length, width, height, weight)
  @cost = parcel.cost_to_ship(shipping)
  erb(:output)
end
