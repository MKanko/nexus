Rails.application.routes.draw do
  
  resources :tasks
  root 'site#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 

  resources :users
  resources :contacts
  resources :clients
  resources :schedules
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
