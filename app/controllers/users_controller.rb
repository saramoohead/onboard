class UsersController < ApplicationController

	def new
		# add a new user form
		@user = User.new
	end

	def create
		# actually add the new user to the database
		@user = User.new(user_params)

		if @user.save

			# we want to give the user a cookie, a ticket, to let us know who they are
			# the web is stateless by default, as in, you don't know what people have done before
			session[:user_id] = @user.id

			flash[:success] = "Thanks for signing up."
			redirect_to root_path
		else
			render "new"
		end
		
	end

	def user_params
		# make sure form data isn't hacked, whitelisting. DO THIS or else!!
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
		
	end


end
