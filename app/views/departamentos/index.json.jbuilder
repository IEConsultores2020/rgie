json.array!(@departamentos) do |departamento|
  json.extract! departamento, :id, :name, :huso, :pais_id, :user_id
  json.url departamento_url(departamento, format: :json)
end
