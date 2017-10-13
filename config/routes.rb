Rails.application.routes.draw do
  resources :comments, only: [:create, :edit, :update, :destroy]
  root 'projects#index'

  resources :projects, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'session/login', to: 'sessions#new'
  post 'session/login', to: 'sessions#create'
  delete 'session/logout', to: 'sessions#destroy'

  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
