module UrlsHelper
	def url_link url
		link = base_domain + url.short_url
		link_to link, link, target: '_blank'
	end

  def base_domain
    Url::BASE_DOMAIN || root_url
  end
end
