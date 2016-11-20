json.array!(@step_definitions) do |step_definition|
  json.extract! step_definition, :id, :task_definition_id, :order

  json.field_definition step_definition.fieldDefinitions do |field_definition|
	json.extract! field_definition, :id, :name, :step_definition_id, :field_type, :validationRegex, :required, :errorMessage, :order 
  end

  json.url step_definition_url(step_definition, format: :json)
end
