class CreateStepDefinitions < ActiveRecord::Migration
  def change
    create_table :step_definitions do |t|
      t.integer :order
      t.references :task_definition, index: true
      t.timestamps
    end
  end
end
