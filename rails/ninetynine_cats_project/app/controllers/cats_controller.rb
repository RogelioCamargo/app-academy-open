class CatsController < ApplicationController
	def index 
		@cats = Cat.all 
		render :index 
	end

	def show 
		@cat = Cat.find_by(id: params[:id])
		if @cat.nil? 
			redirect_to cats_url
		else 
			render :show
		end
	end 

	def new 
		@cat = Cat.new 
		render :new
	end

	def edit 
		@cat = Cat.find_by(id: params[:id])
		render :edit
	end

	def create 
		@cat = Cat.new(cat_params)
		if @cat.save 
			redirect_to cat_url(@cat)
		else 
			render :new, status: :unprocessable_entity
		end
	end

	def update 
		@cat = Cat.find(params[:id])
		if @cat.update(cat_params)
			redirect_to cat_url(@cat)
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private 

	def cat_params
		params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
	end
end