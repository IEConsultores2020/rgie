json.array!(@tiendas) do |tienda|
  json.extract! tienda, :id, :nombre, :descripcion, :empresa_id
  json.url tienda_url(tienda, format: :json)
end
