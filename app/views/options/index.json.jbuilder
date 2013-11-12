json.array!(@options) do |option|
  json.extract! option, :content, :value
  json.url option_url(option, format: :json)
end
