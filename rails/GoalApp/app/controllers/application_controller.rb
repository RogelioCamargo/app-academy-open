class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user, :current_user_username, :current_user_id

	def current_user
		return nil unless session[:session_token]
		@current_user ||= User.find_by(session_token: session[:session_token])
	end 

	def current_user_id 
		current_user ? current_user.id : nil
	end

	def current_user_username 
		current_user ? current_user.username : nil
	end
	
	def logged_in?
		!!current_user
	end 

	def login_user!(user)
		session[:session_token] = user.reset_session_token!
	end

	def logout_user!
		current_user.reset_session_token!
		session[:session_token] = nil
	end 
end
