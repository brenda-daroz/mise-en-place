class RemoveVeganAndVegetarianFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :vegan, :boolean
    remove_column :recipes, :vegetarian, :boolean
  end
end
