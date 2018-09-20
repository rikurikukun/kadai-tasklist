Rails.application.routes.draw do
  resources :tasks
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
