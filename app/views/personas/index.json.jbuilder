json.array!(@personas) do |persona|
  json.extract! persona, :id, :user_id, :usuarioasignado, :ciudad_id
  json.url persona_url(persona, format: :json)
end
