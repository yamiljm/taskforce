json.extract! @step, :id, :order, :task_id, :created_at, :updated_at
json.fields @step.fields do |field|
	json.extract! field, :id, :name, :step_id, :fieldType, :validationRegex, :required, :errorMessage, :order, :value 
end