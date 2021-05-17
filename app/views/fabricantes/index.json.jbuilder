json.array!(@fabricantes) do |fabricante|
  json.extract! fabricante, :id, :nombre, :user_id
  json.url fabricante_url(fabricante, format: :json)
end
