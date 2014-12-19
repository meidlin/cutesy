class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token
  # protect_from_forgery with: :exception

  before_action :check_auth

  def current_user
  	@current_user = User.where(id: session[:user_id]).first
  end

  helper_method :current_user

  def index
  end

  def check_auth
    if !session[:user_id]
      # Well, this person hasn't signed up yet.  Make a shell of a user account for them.
      session[:user_id] = User.create().id
    end
  end

end
