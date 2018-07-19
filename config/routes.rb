Rails.application.routes.draw do
  
  get    '/ajuda',   to: 'help#help'
  get    '/geral',   to: 'general#general'
  get    '/signup',  to: 'users#new'
  get    '/goods/buscando', to: 'goods#searching'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, exception: [:new, :create]
  resources :goods
  resources :expenses
  resources :sales

  post  'goods/busca' => 'goods#search' 
  post 'geral/busca' => 'general#search'

  resources :users do
  	get :current, on: :collection # users#current
  end

  root 'users#current_user_menu'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
