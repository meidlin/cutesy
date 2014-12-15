class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def edit
	end

	def show
	end

	def new
		@users = User.all
	end

end
