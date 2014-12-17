class RatingsController < ApplicationController

	# def create
	# 	@pet = Pet.find(8)
	# 	@pet.ratings << Rating.create(params.require(:rating).permit(:pet_id, :user_id, :rating))
	# 	@pet.save
		
	# 	render json: params

	# end


	def create
		rating_params = params["rating"]
		Rating.create({user_id: rating_params["user_id"], pet_id: rating_params["pet_id"], rating: rating_params["rating"]})

		# Find the next pup randomly
		
		render json: {dude: "hello"}
	end

	def rating_params
		params.require(:rating).permit(:user_id, :pet_id, :rating)
	end

end
