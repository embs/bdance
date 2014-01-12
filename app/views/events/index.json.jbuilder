json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :local, :date, :hour, :users
  json.url event_url(event, format: :json)
end
