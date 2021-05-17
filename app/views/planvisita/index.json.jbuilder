json.array!(@planvisita) do |planvisitum|
  json.extract! planvisitum, :id, :usuarioasignado, :fechavisita, :puntoventum_id, :user_id
  json.url planvisitum_url(planvisitum, format: :json)
end
