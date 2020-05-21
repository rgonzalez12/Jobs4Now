Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/submit_application/:job_id' => 'jobs#submit_application', as: 'submit_application'
  post '/submit_registration/:event_id' => 'events#submit_registration', as: 'submit_registration'

  resources :users

  resources :jobs

  resources :events

  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
end