# == Schema Information
#
# Table name: shorten_urls
#
#  id           :integer(8)      not null, primary key
#  short_url    :string          not null
#  long_url     :string          not null
#  submitter_id :integer(4)      not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'securerandom'

class ShortenUrl < ApplicationRecord
	validates :short_url, :long_url, :submitter_id, presence: true
	validates :short_url, uniqueness: true
	validate :no_spamming, :nonpremium_max

	belongs_to :submitter, 
		class_name: :User,
		foreign_key: :submitter_id,
		primary_key: :id

	has_many :visits,
		class_name: :Visit,
		foreign_key: :shorten_url,
		primary_key: :id
		dependent: :destroy

	has_many :visitors,
		-> { distinct },
		through: :visits,
		source: :visitor

	has_many :taggings,
		class_name: :Tagging,
    foreign_key: :shorten_url_id,
    primary_key: :id,
    dependent: :destroy

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

	def self.random_code 	
		loop do 
			random_code = SecureRandom.urlsafe_base64
			return random_code unless ShortenUrl.exists?(short_url: random_code)
		end
	end

	def self.generate_shorten_url!(user, long_url)
		ShortenUrl.create!(
			short_url: ShortenUrl.random_code,
			long_url: long_url,
			submitter_id: user.id
		)
	end

	def num_clicks
		visits.count
	end

	def num_uniques
		# visits.select(:visitor_id).distinct.count
		visitors.count
	end

	def num_recent_uniques
		# visits
		# 	.select(:visitor_id)
		# 	.where('created_at > ?', 10.minutes.ago)
		# 	.distinct
		# 	.count

		visitors.where('visits.created_at > ?', 10.minutes.ago).count
	end

	def no_spamming
		submissions_in_last_minute = ShortenUrl
			.where('created_at >= ?', 1.minute.ago)
			.where(submitter_id: submitter_id)
			.length

		errors['maximum'] << 'of 5 submissions per minute' if submissions_in_last_minute > 5
	end

	def nonpremium_max
		return if User.find(submitter_id: submitter_id).premium

		total_submissions = ShortenUrl
			.where(submitter_id: submitter_id)
			.length
			
		errors['Only'] << "premum members can create more than 5 short urls" if total_submissions > 5
	end


	def self.prune(n)
    ShortenUrl
      .joins(:submitter)
      .joins('LEFT JOIN visits ON visits.shortened_url_id = shortened_urls.id')
      .where("(shortened_urls.id IN (
        SELECT shortened_urls.id
        FROM shortened_urls
        JOIN visits
        ON visits.shortened_url_id = shortened_urls.id
        GROUP BY shortened_urls.id
        HAVING MAX(visits.created_at) < \'#{n.minute.ago}\'
      ) OR (
        visits.id IS NULL and shortened_urls.created_at < \'#{n.minutes.ago}\'
      )) AND users.premium = \'f\'")
      .destroy_all

    # The sql for the query would be:
    #
    # SELECT shortened_urls.*
    # FROM shortened_urls
    # JOIN users ON users.id = shortened_urls.submitter_id
    # LEFT JOIN visits ON visits.shortened_url_id = shortened_urls.id
    # WHERE (shortened_urls.id IN (
    #   SELECT shortened_urls.id
    #   FROM shortened_urls
    #   JOIN visits ON visits.shortened_url_id = shortened_urls.id
    #   GROUP BY shortened_urls.id
    #   HAVING MAX(visits.created_at) < "#{n.minute.ago}"
    # ) OR (
    #   visits.id IS NULL and shortened_urls.created_at < '#{n.minutes.ago}'
    # )) AND users.premium = 'f'
  end
end

