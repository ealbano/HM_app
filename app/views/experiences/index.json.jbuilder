json.array!(@experiences) do |experience|
  json.extract! experience, :id, :title, :content
  json.url experience_url(experience, format: :json)
end
