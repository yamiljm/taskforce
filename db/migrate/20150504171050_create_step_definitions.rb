class CreateStepDefinitions < ActiveRecord::Migration
  def change
    create_table :step_definitions do |t|
      t.integer :task_id
      t.integer :order

      t.timestamps
    end
  end
end
