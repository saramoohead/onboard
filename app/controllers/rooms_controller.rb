class RoomsController < ApplicationController

	def index
		#this is the home page
		@rooms = Room.limit(5)
	end

	def show
		# this is an individual room
		@room = Room.find(params[:id])
	end

	def new
		# add a new room form
		@room = Room.new
	end

	def create
		# actually add the new room to the database
		@room = Room.new(room_params)

		if @room.save
			flash[:success] = "You've added your room."
			redirect_to room_path(@room)
		else
			render "new"
		end
		
	end

	def edit
		# make the rooms editable
		@room = Room.find(params[:id])

	end

	def update
		# actually update the database 
		@room = Room.find(params[:id])

		if @room.update (room_params)
			flash[:success] = "You've updated your room."
			redirect_to room_path(@room)
		else
			render "edit"
		end

	end

	def destroy
		# actually delete from the databae, the action
		@room = Room.find(params[:id])

		@room.destroy

		flash[:success] = "The room has been deleted."

		redirect_to root_path

	end	


	def room_params
		# make sure form data isn't hacked
		params.require(:room).permit(:name, :address, :description, :number_of_guests, :image)
		
	end

end
