class Reservation < ApplicationRecord
	validates :start_date,
	presence: true,
	uniqueness: true
	validates :end_date,
	presence: true,
	uniqueness: true
	belongs_to :guest, class_name: "User"
	belongs_to :flat

	after_create :show_welcome

	def show_welcome
	   puts self.flat.welcome_message
	end
end
