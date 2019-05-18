Rails.application.routes.draw do
  resources :games
  resources :arcades
  resources :players

  root to: 'static#home'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
