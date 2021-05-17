json.array!(@visita) do |visitum|
  json.extract! visitum, :id, :puntoventum_id, :horaingreso, :horasalida, :user_id
  json.url visitum_url(visitum, format: :json)
end
