class SocialLoginsController < ApplicationController

	# we want to handle log in or sign up with social networks
	def create

		#get data form the omniauth that returns back
		@data = request.env["omniauth.auth"]

		# this is data from omniauth
		@provider = @data["provider"]
		@provider_id = @data["uid"]

		# are there any users on the site that have this provider and provider id?

		@users = User.where(provider: @provider, provider_id: @provider_id)
		
		if @users.any?
			 # sign in as the first user we have in the list
			 @user = @users.first
			 session[:user_id] = @user.id
			 flash[:success] = "You are now logged in."
			 redirect_to root_path
		else
			# make a user with the details from omniauth
			@user = User.new

			# fill in the provider details
			@user.provider = @provider
			@user.provider_id = @provider_id

			# let's get the users info from omniauth
			@user.name = @data["info"]["name"]
			@user.username = @data["info"]["nickname"]
			@user.email = @data["info"]["email"]

			# let's fill in the user's password
			@user.password = "qwerkjh9823adfsag98792jhkasdfh341bvdahfdflg497623"
			@user.password_confirmation = "qwerkjh9823adfsag98792jhkasdfh341bvdahfdflg497623"

			# let's save the details for the provider API
			@user.key = @data["credentials"]["token"]
			@user.secret = @data["credentials"]["secret"]

			@user.save!

			session[:user_id] = @user.id
			flash[:success] = "You are now signed up to Onboard"
			redirect_to root_path

		end

	end

end
