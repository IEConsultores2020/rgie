json.array!(@componentes) do |componente|
  json.extract! componente, :id, :codigo, :nombre, :descripcion
  json.url componente_url(componente, format: :json)
end
