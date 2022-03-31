Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	
  # Defines the root path route ("/")
  # root "articles#index"
	resources :users, only: %i(create new show)
	resource :session, only: %i(create destroy new)
	resources :goals, only: %i(create new show)
end
