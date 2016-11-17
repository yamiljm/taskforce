json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :task_type, :description, :status, :currentStep, [steps: :fields]
  json.url task_url(task, format: :json)
end
