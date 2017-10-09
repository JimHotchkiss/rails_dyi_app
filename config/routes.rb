Rails.application.routes.draw do
  root 'projects#index'

  resources :category, only: [:show] do
    resources :projects, only: [:show, :index]
    # this will give the user the ability to search
    # categories/:id/projects or categories/:id/projects/:id
    # nested resource for posts
  end

  get 'session/login', to: 'sessions#new'
  post 'session/login', to: 'sessions#create'
  delete 'session/logout', to: 'sessions#destroy'

  resources :users
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
