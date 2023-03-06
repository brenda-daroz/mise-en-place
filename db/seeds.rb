# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'open-uri'
require 'json'
require 'rest-client'

puts "Destroying recipes"
# Recipe.destroy_all

def api_key
  ENV.fetch("SPOONACULAR_API_KEY")
end

api_data = { key: api_key }
url = RestClient.get("https://api.spoonacular.com/recipes/random?apiKey=#{api_data[:key]}")
response = JSON.parse(url)
result = response["recipes"]
title = result[0]["title"]
summary = result[0]["summary"]
vegetarian = result[0]["vegetarian"]
vegan = result[0]["vegan"]
image = result[0]["image"]
servings = result[0]["servings"]
readyInMinutes = result[0]["readyInMinutes"]


recipe = Recipe.new(
  title: title,
  summary: summary,
  vegetarian: vegetarian,
  vegan: vegan,
  image: image,
  servings: servings,
  readyInMinutes: readyInMinutes
)

p recipe
