class CatRentalRequest < ApplicationRecord
	STATUS_STATES = %w(PENDING APPROVED DENIED).freeze

	validates :start_date, :end_date, :status, presence: true
	validates :status, inclusion: STATUS_STATES
	validate :does_not_overlap_approved_request

	belongs_to :cat,
		class_name: :Cat,
		foreign_key: :cat_id,
		primary_key: :id 

	def pending?
    self.status == 'PENDING'
  end

	def approved?
    self.status == 'APPROVED'
  end

  def denied?
    self.status == 'DENIED'
  end

	def approve! 
		raise 'not pending' unless self.status == 'PENDING'
		transaction do 
			self.status = 'APPROVED'
			self.save!

			overlapping_pending_requests.each do |req|
				req.update!(status: 'DENIED')
			end
		end
	end

  def deny!
    self.status = 'DENIED'
    self.save!
  end

	private

	def overlapping_requests
		CatRentalRequest
			.where.not(id: self.id)
			.where(cat_id: self.cat_id)
			.where.not('start_date > :end_date OR end_date < :start_date',
						 start_date: self.start_date, end_date: self.end_date)
	end

	def overlapping_pending_requests
    overlapping_requests.where('status = \'PENDING\'')
  end

	def overlapping_approved_requests
		overlapping_requests.where('status = \'APPROVED\'')
	end

	def does_not_overlap_approved_request
		return if self.denied?
		
		unless overlapping_approved_requests.exists?
			errors[:base] << 'Request conflicts with existing approved request'
		end
	end
end
