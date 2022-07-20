class API::TodosController < ApplicationController 
	def index 
		
	end

	def show 
		
	end

	def create 
		
	end

	def destroy 

	end

	def update 

	end

	private 

	def todo_params 
		params.require(:todo).permit(:title, :body, :done)
	end
end