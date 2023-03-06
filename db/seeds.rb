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

result = response["recipes"][0]

title = result["title"]
summary = result["summary"]
vegetarian = result["vegetarian"]
vegan = result["vegan"]
image = result["image"]
servings = result["servings"]
ready_in_minutes = result["readyInMinutes"]

recipe = Recipe.new(
  title: title,
  summary: summary,
  vegetarian: vegetarian,
  vegan: vegan,
  image: image,
  servings: servings,
  readyInMinutes: ready_in_minutes
)

p recipe

result_instructions = result["analyzedInstructions"][0]["steps"][0]

steps_number = result_instructions["number"]
steps_content = result_instructions["step"]

step = Step.new(step: steps_content, number: steps_number)

p step
