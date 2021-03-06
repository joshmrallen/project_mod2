Rails.application.routes.draw do
  # resources :words
  #TODO: Add Welcome controller with home action and put it as root 'welcome#home'
  root 'users#show'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
  get 'define/quotes/:quote_id/:word_query', to: 'quotes#define', as: 'word_definition'
  get '/users/:id/favorites', to: 'users#favorites', as: 'favorite_quotes'
  post '/users/:id/favorites/:quote_id', to: 'users#remove_favorite'
  post '/quotes/:quote_id', to: 'users#add_to_user_favorites'
  get '/quotes', to: 'quotes#index'
  delete 'quotes/:id', to: 'quotes#destroy'

  resources :favorites
  # resources :quotes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
