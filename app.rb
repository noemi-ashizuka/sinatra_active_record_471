require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
# require 'pry-byebug'

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  restaurant_id = params[:id]
  @restaurant = Restaurant.find(restaurant_id)
  erb :show
end

post "/restaurants" do
  name = params[:name]
  address = params[:address]
  restaurant = Restaurant.new(name: name, address: address)
  restaurant.save
  redirect "/"
end

# HTTP Verbs
# GET
# POST to add data
# PUT/PATCH update
# DELETE 