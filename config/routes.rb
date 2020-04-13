Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users, only: [:new, :create], path_names: {new: 'sign_up'}
end
