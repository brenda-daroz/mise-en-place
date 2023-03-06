# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts "Destroying recipes"
Recipe.destroy_all

API_KEY = ENV.fetch["API_KEY"]

url = "https://api.spoonacular.com/recipes/random?number=10?apiKey=#{API_KEY}"
response_serialized = URI.open(url).read
response = JSON.parse(response_serialized)

puts response
