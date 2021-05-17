json.array!(@canals) do |canal|
  json.extract! canal, :id, :name, :tipocanal_id, :user_id
  json.url canal_url(canal, format: :json)
end
