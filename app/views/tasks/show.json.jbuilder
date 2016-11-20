json.extract! @task, :id, :user_id, :name, :task_type, :description, :status, :currentStep, :steps, :created_at, :updated_at
json.steps @task.steps do |step|
  	json.extract! step, :id, :order, :task_id

  	json.fields step.fields do |field|
  		json.extract!field, :id, :name, :step_id, :fieldType, :validationRegex, :required, :errorMessage, :order, :value 
  	end
  end