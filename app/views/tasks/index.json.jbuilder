json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :task_type, :description, :status, :currentStep

  json.steps task.steps do |step|
  	json.extract! step, :id, :order, :task_id
  	
  	json.fields step.fields do |field|
  		json.extract!field, :id, :name, :step_id, :fieldType, :validationRegex, :required, :errorMessage, :order, :value 
  	end
  end
  json.url task_url(task, format: :json)
end
