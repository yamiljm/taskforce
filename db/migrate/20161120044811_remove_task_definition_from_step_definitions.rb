class RemoveTaskDefinitionFromStepDefinitions < ActiveRecord::Migration
  def change
    #remove_column :step_definitions, :task_definition, :references
    drop_table :step_definitions
  end
end
