json.array!(@steps) do |step|
  json.extract! step, :id, :order, :task_id

  json.fields step.fields do |field|
	json.extract! field, :id, :name, :step_id, :fieldType, :validationRegex, :required, :errorMessage, :order, :value 
  end

  json.url step_url(step, format: :json)
end
