class SessionsController < ApplicationController
	before_action :require_no_user!, only: %i(create new)
	
  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] << ['Incorrect username and/or password']
			render :new
		else
			login!(user)
			redirect_to cats_url
		end
  end

	def destroy
    logout!
    redirect_to new_session_url
  end

  def new
		render :new
  end
end