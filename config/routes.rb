Rails.application.routes.draw do
	root to: 'urls#new'
	resources :urls, only: [:create, :show, :new]
	get "/:short_url", to: "urls#redirect_to_original_url"

	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'sessions/signout', to: 'sessions#destroy', as: 'signout'

	resources :sessions, only: [:create, :destroy]
end
