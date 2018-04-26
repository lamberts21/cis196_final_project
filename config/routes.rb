Rails.application.routes.draw do
  root 'welcome#index'
  resources :workouts do
    resources :exercises, only: [:create, :destroy]
  end
  resources :recipes do
    resources :ingredients, only: [:create, :destroy]
  end
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/users/:id/favorite_workout', to: 'users#add_favorite_workout'
  post '/users/:id/favorite_recipe', to: 'users#add_favorite_recipe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
