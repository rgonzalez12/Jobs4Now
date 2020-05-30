Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/submit_application/:job_id' => 'jobs#submit_application', as: 'submit_application'
  post '/submit_registration/:event_id' => 'events#submit_registration', as: 'submit_registration'

  get '/hosted-jobs' => 'jobs#hosted_jobs', as: 'hosted_jobs'
  get '/hosted-events' => 'events#hosted_events', as: 'hosted_events'

  resources :users do
   resource :applications, only: [:show, :index, :destroy], controller: :jobs
   resource :registrations, only: [:show, :index, :destroy], controller: :events
  end

  resources :jobs

  resources :events

  get '/auth/github/callback', to: 'sessions#github_login'
end