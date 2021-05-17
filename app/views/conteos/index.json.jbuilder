json.array!(@conteos) do |conteo|
  json.extract! conteo, :id, :cantidad, :codbarras, :inventario_id
  json.url conteo_url(conteo, format: :json)
end
