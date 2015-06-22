json.array!(@urls) do |url|
  json.extract! url, :id, :short_url, :original_url
  json.url url_url(url, format: :json)
end
