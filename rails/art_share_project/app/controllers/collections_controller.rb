class CollectionsController < ApplicationController
	def index
    collections = Collection.where(user_id: params[:user_id])
    render json: collections
  end

  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: collection, status: :created
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    render json: collection
  end

	private

  def collection_params
    params.require(:collection).permit(:user_id, :name)
  end

end