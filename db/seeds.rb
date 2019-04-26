# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
User.destroy_all
Flat.destroy_all
Reservation.destroy_all

20.times do
	c = City.create!(name: Faker::Address.city,
		zip_code: "69000")

	u = User.create!(email: Faker::Internet.email,
		phone_number: "+33633582389",
		description: Faker::Lorem.paragraph,
		city: c)

	f = Flat.create!(available_beds: rand(1..9),
		price: rand(1..4000),
		description: Faker::Lorem.paragraph_by_chars(140),
		has_wifi: true,
		welcome_message: Faker::Lorem.paragraph,
		city: c,
		admin: u)

	r = Reservation.create!(start_date: Faker::Time.forward(1, :day),
		end_date: Faker::Time.forward(30, :day),
		guest: u,
		flat: f)
end