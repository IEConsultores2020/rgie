json.array!(@equipos) do |equipo|
  json.extract! equipo, :id, :referencia, :descontinuado, :fabricante_id, :user_id
  json.url equipo_url(equipo, format: :json)
end
