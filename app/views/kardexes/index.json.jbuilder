json.array!(@kardexes) do |kardex|
  json.extract! kardex, :id, :valor_compra, :valor_venta, :fecha_ingreso, :inventario_id
  json.url kardex_url(kardex, format: :json)
end
