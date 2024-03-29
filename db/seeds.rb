# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
# require 'open-uri'
require 'json'
require 'rest-client'

puts "Destroying recipes and ingredients and users and favorites"
Recipe.all.each do |recipe|
  recipe.photo.purge
end
Recipe.destroy_all
Ingredient.destroy_all
User.destroy_all

puts "creating default admin user"

admin = User.create(
  email: "admin@test.com",
  password: "123456",
  username: "admin",
  admin: true
)

puts 'Creating 10 fake users...'
10.times do
  User.create(
    email: "#{Faker::Name.first_name}@gmail.com",
    password: "123456",
    username: "#{Faker::Name.first_name}"
  )
end

def api_key
  ENV.fetch("SPOONACULAR_API_KEY")
end

api_data = { key: api_key }
url = RestClient.get("https://api.spoonacular.com/recipes/random?number=40&apiKey=#{api_data[:key]}")
response = JSON.parse(url)

results = response["recipes"]

results.each do |result|
  title = result["title"]
  summary = result["summary"]
  vegetarian = result["vegetarian"]
  vegan = result["vegan"]
  image = result["image"]
  servings = result["servings"]
  ready_in_minutes = result["readyInMinutes"]

  category = "meat"
  category = "vegan" if vegan
  category = "vegetarian" if vegetarian
  category = "vegan" if vegan && vegetarian

  puts "Creating a recipe ..."

  file = URI.open(image)

  recipe = Recipe.new(
    title:,
    summary:,
    servings:,
    readyInMinutes: ready_in_minutes,
    category:,
    user: admin
  )
  recipe.photo.attach(io: file, filename: recipe.title, content_type: "image/jpg")
  recipe.save!
  p recipe

  puts "Getting the steps for that recipe ..."

  steps_result = result["analyzedInstructions"][0]["steps"]
  steps_result.map do |step|
    number = step["number"]
    step = step["step"]
    step_instance = Step.new(step:, number:, recipe_id: recipe[:id])
    step_instance.save!
  end

  puts "Getting ingredients and measurements ..."

  ingredients_list = result["extendedIngredients"]
  ingredients_list.map do |ingredient|
    name = ingredient["name"]
    if Ingredient.find_by(name:)
      ingredient_instance = Ingredient.find_by(name:)
    else
      ingredient_instance = Ingredient.new(name:)
      ingredient_instance.save!
    end

    us_amount = ingredient["measures"]["us"]["amount"]
    eu_amount = ingredient["measures"]["metric"]["amount"]
    us_unit = ingredient["measures"]["us"]["unitShort"]
    eu_unit = ingredient["measures"]["metric"]["unitShort"]
    recipe_ingredient = RecipeIngredient.new(
      recipe_id: recipe[:id],
      ingredient_id: ingredient_instance[:id],
      measurement_us_amount: us_amount,
      measurement_eu_amount: eu_amount,
      measurement_us_unit: us_unit,
      measurement_eu_unit: eu_unit
    )
    recipe_ingredient.save!
  end
end

User.all.each do |user|
  Recipe.all.each do |recipe|
    favo = Favourite.new(user_id: user.id, recipe_id: recipe.id)
    favo.save!
  end
end

# iterate throught all users
# for each user, create a new favorite
# Favorite.create(user: , receipe: )
