class Order < ActiveRecord::Base
	# associations
	belongs_to :room
	belongs_to :user

	# validations
	
	# plug ins
	
	# everything else

end
