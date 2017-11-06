Rails.application.routes.draw do
  root 'pages#show'

  resources :users, only: [:index, :create]

  get '/sign-up', to: 'users#new', as: 'sign_up'
  get '/dashboard', to: 'users#show', as: 'dashboard'

  get '/log-in', to: 'sessions#new', as: 'log_in'
  post '/log-in', to: 'sessions#create'
  get '/log-out', to: 'sessions#destroy', as: 'log_out'
end
