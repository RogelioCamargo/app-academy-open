Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "static_pages#root"
	namespace :api, defaults: { format: :json } do 
		resources :todos, except: %i(new edit)
	end
end
