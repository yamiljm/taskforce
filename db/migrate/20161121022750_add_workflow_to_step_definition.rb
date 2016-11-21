class AddWorkflowToStepDefinition < ActiveRecord::Migration
  def change
    add_reference :step_definitions, :workflow, index: true
  end
end
