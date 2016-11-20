json.array!(@task_definitions) do |task_definition|
  json.extract! task_definition, :id, :name, :type, :description

  json.step_definitions task_definition.stepDefinitions do |step_definition|
  	json.extract! step_definition, :id, :order, :task_id

  	json.fields step_definition.fieldDefinitions do |field_definition|
  		json.extract!field_definition, :id, :name, :step_definition_id, :field_type, :validationRegex, :required, :errorMessage, :order
  	end
  end

  json.url task_definition_url(task_definition, format: :json)
end
