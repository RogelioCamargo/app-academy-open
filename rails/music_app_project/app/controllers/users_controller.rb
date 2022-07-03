class UsersController < ApplicationController
	def new 
		@user = User.new
		render :new 
	end

	def create 
		@user = User.new(user_params)
		if user.save
			login_user!(@user)
			redirect_to root_url
		else
			flash.now[:errors] = @user.errors.full_messages 
			render :new, status: :unprocessable_entity
		end
	end

	private 

	def user_params 
		params.requires(:user).permit(:email, :password)
	end
end