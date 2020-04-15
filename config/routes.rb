Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :users

  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
end
