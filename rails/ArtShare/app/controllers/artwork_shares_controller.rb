class ArtworkSharesController < ApplicationRecord
	def create
		artwork_share = ArtworkShare.new(artwork_share_params)
		if artwork_share.save
			render json: artwork_share
		else
			render json: artwork_share.errors.full_messages, status: :unprocessable_entity
	end

	def destroy
		artwork_share = ArtworkShare.find(params[:id])
		artwork_share.destory
		render json: artwork_share
	end

	private
	
	def artwork_share_params
		params.require(:artwork_share).permit(:visitor_id, :artwork_id)
	end
end