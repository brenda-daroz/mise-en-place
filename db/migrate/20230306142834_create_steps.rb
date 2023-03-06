class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
