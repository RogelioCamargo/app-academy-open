Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

	resources :users, only: %i(new create show)
	resource :session, only: %i(new create destroy)
	resources :bands do 
		resources :albums, only: %i(new)
	end

	resources :albums, except: %i(new)
end
