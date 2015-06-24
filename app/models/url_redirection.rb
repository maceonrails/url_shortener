class UrlRedirection
	attr_accessor :url

	def initialize(url)
		@url = url
	end

	def redirection_url
		url.original_url
	end

	def redirection(request)
		create_stat(request)
		return redirection_url
	end

	def create_stat(request)
		url.stats.create(
			user_agent: request.user_agent,
			ip_address: request.remote_ip,
			referrer_url: request.referer
		)
	end
	
end