class Ticket < ActiveRecord::Base
	# ASSOCIATIONS
	belongs_to :event
	belongs_to :user

	# VALIDATIONS
	validates :ticket_num, presence: true, uniqueness: true, length: { maximum: 9 }

end
