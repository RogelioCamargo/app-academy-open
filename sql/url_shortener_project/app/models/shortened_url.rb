class ShortenedUrl < ApplicationRecord
	validates :long_url, :short_url, presence: true 
	validates :short_url, uniqueness: true 
	validate :no_spamming, :nonpremium_max

	belongs_to :submitter, 
		primary_key: :id, 
		foreign_key: :user_id, 
		class_name: :User 

	has_many :visits,
		primary_key: :id, 
		foreign_key: :shorten_url_id, 
		class_name: :Visit, 
		dependent: :destroy

	has_many :visitors, 
		-> { distinct },
		through: :visits, 
		source: :visitor

	has_many :taggings, 
		primary_key: :id, 
		foreign_key: :shorten_url_id, 
		class_name: :Tagging, 
		dependent: :destroy 

	has_many :tag_topics, 
		through: :taggings, 
		source: :tag_topic

	def self.create_with_user_and_long_url!(user, long_url)
		ShortenedUrl.create!(
			user_id: user.id, 
			long_url: long_url,
			short_url: ShortenedUrl.random_code
		)
	end

	def self.random_code 
		loop do 
			random_code = SecureRandom::urlsafe_base64(16)
			return random_code unless ShortenedUrl.exists?(short_url: random_code)
		end
	end

	def num_clicks 
		visits.count
	end	

	def num_uniques 
		visits.select('user_id').distinct.count 
	end

	def num_recent_uniques 
		visits.select('user_id')
			.where('created_at > ?', 10.minutes.ago)
			.distinct.count
	end

	private

	def no_spamming
    last_minute = ShortenedUrl
      .where('created_at >= ?', 1.minute.ago)
      .where(user_id: user_id)
      .length

    errors[:maximum] << 'of five short urls per minute' if last_minute >= 5
  end

  def nonpremium_max
    return if User.find(self.user_id).premium

    number_of_urls =
      ShortenedUrl
        .where(user_id: user_id)
        .length

    if number_of_urls >= 5
      errors[:Only] << 'premium members can create more than 5 short urls'
    end
  end
end