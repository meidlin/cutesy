class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
		@pets = current_user.pets
	end

	def show
		@user = User.find(params[:id])
		@pets = @user.pets
	end

	def new
		@users = User.new
	end


	def edit
	end

	def update
		respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end
    end

private

		def set_user
      	@user = User.find(params[:id])
    	end

	    def user_params
	      params.require(:user).permit( :screen_name, :email, :description)
	    end




end
