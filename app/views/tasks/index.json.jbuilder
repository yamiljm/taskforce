json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :task_type, :description, :status, :currentStep, :user_id, :created_at, :updated_at

  json.steps task.steps do |step|
  	json.extract! step, :id, :order, :task_id

  	json.fields step.fields do |field|
  		json.extract!field, :id, :name, :step_id, :fieldType, :validationRegex, :required, :errorMessage, :order, :value, :options 
  	end

  end

  json.url task_url(task, format: :json)

end
