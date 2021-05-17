json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :nombre, :webpage, :email
  json.url empresa_url(empresa, format: :json)
end
