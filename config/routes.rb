Rails.application.routes.draw do

  resources :arcades, only: [:show] do
    resources :games, only: [:show, :index]
  end
 
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :players

  root 'static#home'
  get '/signin' => 'players#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
