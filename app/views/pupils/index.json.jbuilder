json.array!(@pupils) do |pupil|
  json.extract! pupil, :id, :first_name, :last_name, :username, :mail, :rg, :cpf, :birth, :phone, :profession, :observations
  json.url pupil_url(pupil, format: :json)
end
