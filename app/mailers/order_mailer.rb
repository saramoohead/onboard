class OrderMailer < ActionMailer::Base
  default from: "sara@onboard.com"

  # the bit that says (order) will put in which order we want to send
  def new_order_notification(order)

  	# make the order available to the view (html)
  	@order = order
  	@room = @order.room
  	@user = @order.user
  	@owner = @room.user

  	mail to: @owner.email, subject: "You have a new order on Onboard", cc: "sara.oconnor@hotkeybooks.com"

  end

end
