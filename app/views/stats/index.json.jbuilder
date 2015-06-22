json.array!(@stats) do |stat|
  json.extract! stat, :id, :url_id, :user_agent, :ip_address, :referrer_url
  json.url stat_url(stat, format: :json)
end
