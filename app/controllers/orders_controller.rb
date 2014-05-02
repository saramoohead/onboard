class OrdersController < ApplicationController
	# The line above means that it will include anything in this code, but the arrow 
	# and application controller means it includes the stuff in the application controller (i.e. the shortcuts)

	# I want to be logged in for ANY area of the orders section
	before_action :make_sure_logged_in

	def new
		# place new order form: tell it what room I want, create a new order, assocaite with user
		@room = Room.find(params[:room_id])
		@order = @room.orders.new
		# to add current_user to the order form
		@order.user = current_user
	end

	def create
		# this is actually charging the customer
		@room = Room.find(params[:room_id])
		@order = @room.orders.new(order_params)
		@order.user = current_user

		if @order.save

			# charge them with stripe, using Stripe gem
			# the amount is always in the base unit, i.e. pence 100 pence is charging £1.00
			Stripe::Charge.create(amount: 100, currency: "gbp",
				card: @order.stripe_token, description: "Onboard order")
			
			# To add in a subscription:
			# Stripe::Customer.create(card: @order.sptripe.token, plan: "subscription", description "Lots of rooms")

			flash[:success] = "Yay, you've ordered this room"
			redirect_to room_path(@room)
		else
			render "new"
		end

	end

	def order_params
		# while list the form data
		params.require(:order).permit(:stripe_token)
	end

end
