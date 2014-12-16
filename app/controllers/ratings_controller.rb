class RatingsController < ApplicationController

	def create
		# take incoming data, and then save. 
		Rating.create(params.require(:rating).permit(:pet_id, :user_id, :rating))
		render json: 'rating accepted'
	end
