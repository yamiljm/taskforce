class AddTaskToStep < ActiveRecord::Migration
  def change
    add_column :steps, :task, :references
  end
end
