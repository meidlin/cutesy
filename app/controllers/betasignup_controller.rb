class BetasignupController < ApplicationController
	def betasignup
	end
	
	def betasignup2
		@user = User.where(id: session[:user_id]).first
	end
	def update
		user = User.where(id: session[:user_id]).first
		user.update(params.require(:user).permit(:email))
		redirect_to betasignup3_path
	end
	def betasignup3
	end
end
