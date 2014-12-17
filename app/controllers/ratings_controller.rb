class RatingsController < ApplicationController

	# def create
	# 	@pet = Pet.find(8)
	# 	@pet.ratings << Rating.create(params.require(:rating).permit(:pet_id, :user_id, :rating))
	# 	@pet.save
		
	# 	render json: params

	# end


	def create
		raise params.inspect
	end

	def rating_params
		params.require(:rating).permit(:user_id, :pet_id, :rating)
	end

end
