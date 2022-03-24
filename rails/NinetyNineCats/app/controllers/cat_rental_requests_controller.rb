class CatRentalRequestsController < ApplicationController
	def new 
		@rental_request = CatRentalRequest.new
		render :new
	end

	def approve
    current_cat_rental_request.approve!
    redirect_to cat_url(current_cat)
  end

	def deny
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat)
  end

	def create 
		@rental_request = CatRentalRequest.create(cat_rental_request_params)
		if @rental_request.save 
			redirect_to cat_url(@rental_request.cat)
		else  
			flash.now[:errors] = @rental_request.errors.full_messages
			render :new
		end
	end

	private 

	def current_cat_rental_request
    debugger
    @rental_request ||=
      CatRentalRequest.includes(:cat).find(params[:id])
  end

	def current_cat
    current_cat_rental_request.cat
  end

	def cat_rental_request_params
		params.require(:cat_rental_request).permit(:start_date, :end_date, :status, :cat_id)
	end
end
