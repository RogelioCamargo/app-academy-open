class GoalsController < ApplicationController
	before_action :require_current_user!, only: %i(create new)
	def create 
		@goal = current_user.goals.new(goal_params)
		if @goal.save 
			redirect_to goal_url(@goal)
		else 
			flash.now[:errors] = @goal.errors.full_messages
			render :new 
		end
	end

	def index 
		@goals = Goal.all
		render :index
	end

	def new 
		@goal = current_user.goals
		render :new 
	end

	def show
		@goal = Goal.find(params[:id])
		render :show
	end

	private 

	def goal_params
		params.require(:goal).permit(:title, :details, :private, :completed)
	end
end
