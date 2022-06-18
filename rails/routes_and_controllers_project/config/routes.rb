Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	resources :users 

	# get '/users', to: 'users#index', as: 'users'
	# post '/users', to: 'users#create'
	# get '/users/new', to: 'users#new', as: 'new_user' 
	# get '/users/:id', to: 'users#show', as: 'user'
	# get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
	# put '/users/:id', to: 'users#update'
	# patch '/users/:id', to: 'users#update'
	# delete '/users/:id', to: 'users#destroy'
end
