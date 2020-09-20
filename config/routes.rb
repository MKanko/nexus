Rails.application.routes.draw do
  
    root 'site#home'

    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    post '/logout' => 'sessions#destroy'

    patch '/switch-cal-view' => 'schedules#switch_cal_view'
    
    get '/auth/facebook/callback' => 'sessions#create'
  
    resources :companies do
        resources :contacts
    end 

    resources :schedules do
        resources :tasks, only: [:new]
    end 
    
    resources :users
    resources :schedules
    resources :tasks, except: [:new]
    resources :contacts, only: [:index, :show]
    
end
