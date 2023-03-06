class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :summary
      t.boolean :vegetarian
      t.string :vegan
      t.string :boolean
      t.string :readyInMinutes
      t.string :integer
      t.integer :servings
      t.integer :image

      t.timestamps
    end
  end
end
