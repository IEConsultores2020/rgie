json.array!(@pais) do |pai|
  json.extract! pai, :id, :name, :huso, :user_id
  json.url pai_url(pai, format: :json)
end
