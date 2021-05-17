json.array!(@medidas) do |medida|
  json.extract! medida, :id, :codigo, :nombre, :descripcion
  json.url medida_url(medida, format: :json)
end
