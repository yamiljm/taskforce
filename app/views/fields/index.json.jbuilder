json.array!(@fields) do |field|
  json.extract! field, :id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order, :step_id
  json.url field_url(field, format: :json)
end
