Rails.application.routes.draw do
  
  root 'site#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 

  
  resources :contacts do
    resources :clients
  end 
  
  resources :users
  resources :schedules
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
