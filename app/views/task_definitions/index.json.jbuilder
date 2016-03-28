json.array!(@task_definitions) do |task_definition|
  json.extract! task_definition, :id, :name, :type, :description
  json.url task_definition_url(task_definition, format: :json)
end
