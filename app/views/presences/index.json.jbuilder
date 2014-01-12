json.array!(@presences) do |presence|
  json.extract! presence, :id, :user, :time
  json.url presence_url(presence, format: :json)
end
