Rails.application.routes.draw do

resources :arcades do
    resources :games
  end
 
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :players


  root 'static#home'
  get '/signup' => 'players#new'
  get '/signin' => 'sessions#new'
  match  '/auth/github/callback', to: 'sessions#github', via: [:get, :post] 
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
