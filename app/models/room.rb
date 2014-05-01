class Room < ActiveRecord::Base

	# assocations (has many orders, belongs to user)

	# validations
	validates :name, presence: true
	validates :address, presence: true
	validates :number_of_guests, presence: true, numericality: { greater_than: 0 }


	# plugins (gems)
	geocoded_by :address
	after_validation :geocode

	# paperclip
	# 960x400# 	will mean crop the image to 960x400
	# 500x 		in Tumblr will make the image 500px wide, no matter what
	# x400		will make the image 400px high
	# 960x400# 	will resize the image to either 960 wide or 400 high
	has_attached_file :image, styles: { large: "960x400#", medium: "320x200#", thumbnail: "60x60#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	# anything else

end
