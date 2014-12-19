class SessionsController < ApplicationController
	def create
		# .access_token
		t_raw = env["omniauth.auth"].extra.raw_info
#		raise t_raw.screen_name

		# screen_name
		# favourites_count:integer
		# followers_count:integer
		# friends_count:integer
		# statuses_count:integer
		# id:integer
		# lang
		# name
		# profile_image_url
		# time_zone
		# utc_offset :integer

		# raise params.inspect
		user = User.where(twitter_id: t_raw.id).first
		if !user
			user = User.create(
				{
					screen_name: t_raw.screen_name,
					favourites_count: t_raw.favourites_count,
					followers_count: t_raw.followers_count,
					friends_count: t_raw.friends_count,
					statuses_count: t_raw.statuses_count,
					twitter_id: t_raw.id,
					lang: t_raw.lang,
					name: t_raw.name,
					profile_image_url: t_raw.profile_image_url,
					time_zone: t_raw.time_zone,
					utc_offset: t_raw.utc_offset,
					description: 'Edit your description! '
				}
			)
		end
    	session[:user_id] = user.id
    	# This is only active while we're getting beta users
    	redirect_to users_path, :notice => "Signed in!"
#    	redirect_to root_path, :notice => "Signed in!"
	end 

	def index
		users = User.all
		render json: users, status: 200
	end

	def show
	end


	def edit
		user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update_attributes(user_params)
		render nothing: true, status: 204
	end

	def user_params
		params.require(:user).permit(:description)
	end




end