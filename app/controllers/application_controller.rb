class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token
  # protect_from_forgery with: :exception

  def current_user
  	@current_user = User.where(id: session[:user_id]).first
  end

  helper_method :current_user

  def index
  end

end
