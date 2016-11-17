class RemoveTaskFromSteps < ActiveRecord::Migration
  def change
    remove_column :steps, :task, :string
  end
end
