json.extract! @step_definition, :id, :task_definition_id, :order, :created_at, :updated_at
json.fields @step_definition.fieldDefinitions do |field_definition|
	json.extract! field_definition, :id, :name, :step_definition_id, :field_type, :validationRegex, :required, :errorMessage, :order 
end