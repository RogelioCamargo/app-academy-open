class CatsController < ApplicationController
	def index
		@cats = Cat.all
		render :index
	end

	def show
		@cat = Cat.find_by(id: params[:id])
		if @cat
			render :show
		else
			render json: @cat.errors.full_messages, status: :unprocessable_entity
		end
	end
end
