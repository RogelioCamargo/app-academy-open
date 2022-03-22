Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	resources :artworks, only: [:create, :destroy, :show, :update] do 
		resources :comments, only: [:index]
	end
	
	resources :users, only: [:create, :destroy, :index, :show, :update] do
		resources :artworks, only: [:index]
		resources :comments, only: [:index]
	end

	resources :artwork_shares, only: [:create, :destroy]

	resources :comments, only: [:index, :create, :destroy]
end
