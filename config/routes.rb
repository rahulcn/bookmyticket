Bookmyticket::Application.routes.draw do
	devise_for :users
	resources :events do
		post 'attend',   to: 'events#attend'
		post 'unattend', to: 'events#unattend'
	end

	root 'events#index'
	match ':controller(/:action(/:id))', via: :get # It handles many cases incase of missing routes.
end
