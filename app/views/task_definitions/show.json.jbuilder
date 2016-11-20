json.extract! @task_definition, :id, :name, :type, :description, :created_at, :updated_at
json.steps @task_definition.stepDefinitions do |step_definition|
  	json.extract! step_definition, :id, :order, :task_definition_id

  	json.fields step_definition.fieldDefinitions do |field_definition|
  		json.extract!field_definition, :id, :name, :step_id, :field_type, :validationRegex, :required, :errorMessage, :order 
  	end
end