class FixTaskColumnName < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :type, :task_type
  end
  
  def change
    rename_column :tasks, :type, :task_type
  end
end
