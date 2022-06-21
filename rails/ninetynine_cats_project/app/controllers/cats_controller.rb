class CatsController < ApplicationController
	def index 
		@cats = Cat.all 
		render :index 
	end

	def show 
		@cat = Cat.find(params[:id])
		if @cat.nil? 
			redirect_to cats_url
		else 
			render :show
		end
	end
end