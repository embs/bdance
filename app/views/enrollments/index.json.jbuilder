json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :pupil, :group
  json.url enrollment_url(enrollment, format: :json)
end
