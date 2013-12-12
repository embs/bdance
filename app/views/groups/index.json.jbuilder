json.array!(@groups) do |group|
  json.extract! group, :id, :name, :description, :price, :time, :local, :start, :end, :modality_id
  json.url group_url(group, format: :json)
end
