class AddNumberAndStepToStepsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :steps, :number, :integer
    add_column :steps, :step, :string
  end
end
