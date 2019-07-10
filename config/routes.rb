Rails.application.routes.draw do

  get 'arcades/most' => 'arcades#most'

resources :arcades do
    resources :games
  end
 
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :players


  root 'static#home'
  get '/signup' => 'players#new'
  get '/signin' => 'sessions#new'
  get '/auth/:provider/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
