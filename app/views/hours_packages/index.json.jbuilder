json.array!(@hours_packages) do |hours_package|
  json.extract! hours_package, :id, :pupils_id, :teacher_id, :price, :horaries, :start, :end
  json.url hours_package_url(hours_package, format: :json)
end
