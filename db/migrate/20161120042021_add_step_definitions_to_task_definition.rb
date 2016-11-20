class AddStepDefinitionsToTaskDefinition < ActiveRecord::Migration
  def change
    add_column :task_definitions, :step_definitions, :string
    add_column :task_definitions, :reference, :string
  end
end
