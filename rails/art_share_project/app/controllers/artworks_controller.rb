class ArtworksController < ApplicationController
	def index 
		render json: Artwork.all 
	end

	def show 
		render json: Artwork.find(params[:id])
	end

	def create 
		artwork = Artwork.create(artwork_params)
		if artwork.save 
			render json: artwork, status: :created
		else 
			render json: artwork.errors.full_messages, status: :unprocessable_entity
		end
	end

	def update 
		artwork = Artwork.find(params[:id])
		if artwork.update(artwork_params)
			render json: artwork
		else 
			render json: artwork.errors.full_messages, status: :unprocessable_entity
		end
	end 

	def destroy 
		artwork = Artwork.find(params[:id])
		artwork.destroy
		render json: artwork
	end

	private 

	def artwork_params 
		params.require(:artwork).permit(:title, :image_url, :artist_id)
	end
end