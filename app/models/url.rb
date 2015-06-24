class Url < ActiveRecord::Base
	has_many :stats
	validates :short_url, presence: true
	validates :short_url, uniqueness: true
	validates :short_url, exclusion: { in: %w(urls stats api) }
	validates :original_url, presence: true
	validates :original_url, uniqueness: { scope: :short_url, message: "short url already exists." }
	validates :original_url, format: { with: URI.regexp }, if: Proc.new { |a| a.original_url.present? }
	validates :short_url, format: { with: /\A[-a-z]+\Z/ }

	BASE_DOMAIN = nil #using root domain if nil

	delegate :redirection, to: :url_redirection

	def url_redirection
		UrlRedirection.new self
	end

	def redirected
		stats.count
	end
end
