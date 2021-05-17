json.array!(@venta) do |ventum|
  json.extract! ventum, :id, :fecha, :qexistencia, :qventa, :puntoventum_id, :equipo_id, :user_id
  json.url ventum_url(ventum, format: :json)
end
