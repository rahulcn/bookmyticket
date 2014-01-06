Bookmyticket::Application.routes.draw do
  devise_for :users






  root 'events#home'
  match ':controller(/:action(/:id))', via: :get # It handles many cases incase of missing routes.
end
