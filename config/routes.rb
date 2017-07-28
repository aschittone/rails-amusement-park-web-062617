Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  root 'application#home'
  get '/attractions', to: 'attractions#index'
  delete '/logout', to: 'sessions#destroy'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  post '/rides', to: 'rides#create'
end
