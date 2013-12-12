json.array!(@rhythms) do |rhythm|
  json.extract! rhythm, :id, :name, :description, :modality
  json.url rhythm_url(rhythm, format: :json)
end
