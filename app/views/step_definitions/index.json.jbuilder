json.array!(@step_definitions) do |step_definition|
  json.extract! step_definition, :id, :task_id, :order
  json.url step_definition_url(step_definition, format: :json)
end
