json.array!(@ciudads) do |ciudad|
  json.extract! ciudad, :id, :name, :latitude, :longitude, :departamento_id, :user_id
  json.url ciudad_url(ciudad, format: :json)
end
