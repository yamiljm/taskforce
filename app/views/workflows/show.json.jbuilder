json.extract! @workflow, :id, :name, :type, :description, :created_at, :updated_at
json.step_definitions @workflow.stepDefinitions do |step_definition|
  	json.extract! step_definition, :id, :order, :task_definition_id

  	json.field_definitions step_definition.fieldDefinitions do |field_definition|
  		json.extract!field_definition, :id, :name, :step_definition_id, :field_type, :validationRegex, :required, :errorMessage, :order 
  	end
end