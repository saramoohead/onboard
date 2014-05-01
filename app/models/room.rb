class Room < ActiveRecord::Base

	# assocations (has many orders, belongs to user)

	# validations
	validates :name, presence: true
	validates :address, presence: true
	validates :number_of_guests, presence: true, numericality: { greater_than: 0 }

	# plugins (gems)
	geocoded_by :address
	after_validation :geocode

	# anything else

end
