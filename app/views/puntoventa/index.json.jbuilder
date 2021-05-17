json.array!(@puntoventa) do |puntoventum|
  json.extract! puntoventum, :id, :name, :mtsmaxdistancia, :latitude, :longitude, :direccion, :telefonos, :email, :tipocanal_id, :ciudad_id, :user_id
  json.url puntoventum_url(puntoventum, format: :json)
end
