json.array!(@field_definitions) do |field_definition|
  json.extract! field_definition, :id, :name, :field_type, :validationRegex, :required, :step_definition_id, :errorMessage, :order
  json.url field_definition_url(field_definition, format: :json)
end
