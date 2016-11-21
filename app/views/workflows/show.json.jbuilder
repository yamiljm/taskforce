json.extract! @workflow, :id, :name, :type, :description, :created_at, :updated_at
json.step_definitions @workflow.step_definitions do |step_definition|
  	json.extract! step_definition, :id, :order, :workflow_id

  	json.field_definitions step_definition.field_definitions do |field_definition|
  		json.extract!field_definition, :id, :name, :step_definition_id, :field_type, :validationRegex, :required, :errorMessage, :order 
  	end
end