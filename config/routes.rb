Rails.application.routes.draw do
  
  resources :sales
  resources :expenses
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, exception: [:new, :create]
  resources :goods

  resources :users do
  	get :current, on: :collection # users#current
  end

  root 'users#current_user_menu'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
