class CreateTaskDefinitions < ActiveRecord::Migration
  def change
    create_table :task_definitions do |t|
      t.string :name
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
