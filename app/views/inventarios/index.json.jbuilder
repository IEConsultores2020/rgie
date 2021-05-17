json.array!(@inventarios) do |inventario|
  json.extract! inventario, :id, :tienda_id, :fecha_ingreso, :moneda, :articulo_id, :cantidad_integer, :valor_unidad, :valor_total,  
  json.url inventario_url(inventario, format: :json)
end
