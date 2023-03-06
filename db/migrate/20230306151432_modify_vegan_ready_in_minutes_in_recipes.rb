class ModifyVeganReadyInMinutesInRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :vegan, :string
    remove_column :recipes, :boolean, :string
    remove_column :recipes, :readyInMinutes, :string
    remove_column :recipes, :integer, :string

    add_column :recipes, :vegan, :boolean
    add_column :recipes, :readyInMinutes, :integer

  end
end
