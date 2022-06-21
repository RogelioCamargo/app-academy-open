class CatRentalRequest < ApplicationRecord
	STATUS_STATES = %w(APPROVED DENIED PENDING).freeze
	validates :start_date, :end_date, :status, presence: true
	validates :status, inclusion: STATUS_STATES
	validate :does_not_overlap_approved_request

	belongs_to :cat

	def approved?
    self.status == 'APPROVED'
  end

  def denied?
    self.status == 'DENIED'
  end

  def pending?
    self.status == 'PENDING'
  end

	private 
	
	def overlapping_requests
		CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date',
                 start_date: start_date, end_date: end_date)
	end

	def overlapping_approved_requests
		overlapping_requests.where('status = \'APPROVED\'')
	end

	def does_not_overlap_approved_request
		return if self.denied?

    unless overlapping_approved_requests.empty?
      errors.add(:base, 'Request conflicts with existing approved request')
    end
	end
end
