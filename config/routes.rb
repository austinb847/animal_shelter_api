Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'animals#index'
  resources :animals
  get '/random' => 'animals#random'
  get '/search' => 'animals#search'
end
