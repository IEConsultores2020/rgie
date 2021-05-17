json.array!(@tipocanals) do |tipocanal|
  json.extract! tipocanal, :id, :nombre, :user_id
  json.url tipocanal_url(tipocanal, format: :json)
end
