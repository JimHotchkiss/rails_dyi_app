Rails.application.routes.draw do
  root 'projects#index'

  get 'session/login', to: 'sessions#new'
  post 'session/login', to: 'sessions#create'
  delete 'session/logout', to: 'sessions#destroy'

  resources :users
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
