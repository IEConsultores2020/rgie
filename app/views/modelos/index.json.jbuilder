json.array!(@modelos) do |modelo|
  json.extract! modelo, :id, :codigo, :nombre, :descripcion
  json.url modelo_url(modelo, format: :json)
end
