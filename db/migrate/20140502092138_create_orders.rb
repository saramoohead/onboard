class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	# I want two associations to order
    	t.integer :user_id
    	t.integer :room_id

		# this will be ther eference on stripe to which credit card 
    	t.string :stripe_token


      t.timestamps
    end
  end
end
