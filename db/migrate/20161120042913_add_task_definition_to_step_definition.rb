class AddTaskDefinitionToStepDefinition < ActiveRecord::Migration
  def change
    add_column :step_definitions, :task_definition, :reference
  end
end
