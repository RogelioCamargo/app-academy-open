class ShortenedUrls < ApplicationRecord
	validates :long_url, :short_url, presence: true 
	validates :short_url, uniquessness: true 
end