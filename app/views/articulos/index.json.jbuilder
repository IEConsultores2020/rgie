json.array!(@articulos) do |articulo|
  json.extract! articulo, :id, :nombre, :descripcion, :foto, :barcode, :unidad_medida_id, :componente_id, :modelo_id
  json.url articulo_url(articulo, format: :json)
end
