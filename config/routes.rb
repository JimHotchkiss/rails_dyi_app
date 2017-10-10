Rails.application.routes.draw do
  resources :comments
  root 'projects#index'

  resources :projects, only: [:show, :index] do
    resources :comments, only: [:show, :index, :new]
    # this will give the user the ability to search
    # categories/:id/projects or categories/:id/projects/:id
    # nested resource for posts
  end

  get 'session/login', to: 'sessions#new'
  post 'session/login', to: 'sessions#create'
  delete 'session/logout', to: 'sessions#destroy'

  resources :users
  resources :projects
  resources :comments
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
