class Flat < ApplicationRecord
	validates :available_beds, :numericality => { :greater_than_or_equal_to => 1},
	presence: true
	validates :price, :numericality => { :greater_than_or_equal_to => 1},
	presence: true
	validates :description, length: { minimum: 140 },
	presence: true
	validates :has_wifi,
	presence: true
	validates :welcome_message,
	presence: true
 
	belongs_to :city
	has_many :reservations
	belongs_to :admin, class_name: "User"
	# has_many :guests, class_name: "User", though: :reservations
end
