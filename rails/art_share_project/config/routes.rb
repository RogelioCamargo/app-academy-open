Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

	resources :users, only: [:index, :create, :show, :update, :destroy] do
		resources :artworks, only: [:index]
	end
	resources :artworks, only: [:create, :show, :update, :destroy] do 
		member do 
			post :like, to: 'artworks#like', as: 'like'
			post :unlike, to: 'artworks#unlike', as: 'unlike'
		end
	end
	resources :artwork_shares, only: [:create, :destroy]
	resources :comments, only: [:index, :create, :destroy] do 
		member do 
			post :like, to: 'comments#like', as: 'like'
			post :unlike, to: 'comments#unlike', as: 'unlike'
		end
	end
end
