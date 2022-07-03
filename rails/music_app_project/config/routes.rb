Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
	root to: redirect('/bands')
	
	resources :users, only: %i(new create show)
	resource :session, only: %i(new create destroy)
	resources :bands do 
		resources :albums, only: %i(new)
	end

	resources :albums, except: %i(new) do 
		resources :tracks, only: %i(new)
	end

	resources :tracks, except: %i(new)

	resources :notes, only: %i(new create)
end
