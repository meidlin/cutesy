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
					utc_offset: t_raw.utc_offset
				}
			)
		end
    	session[:user_id] = user.id
    	redirect_to root_url, :notice => "Signed in!"
	end 
end