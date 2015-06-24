module UrlsHelper
	def url_link url
		link = root_url + url.short_url
		link_to link, link
	end
end
