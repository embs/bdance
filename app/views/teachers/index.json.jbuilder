json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :rg, :cpf, :first_name, :last_name, :mail, :username, :birth, :phone
  json.url teacher_url(teacher, format: :json)
end
