Rails.application.routes.draw do
  resources :databases, only: [:show]
  devise_for :users
  resources :projects, only: [:new, :create, :show, :index] do
    resources :collaborators, only: [:new, :create]
    resources :databases, only: [:index, :create]
  end

  resources :databases, only: [] do
    resources :tables, only: [:index] do
      resources :comments, only: :create
    end
  end

  resources :database_table_preferences, only: :update

  resources :columns, only: [] do
    resources :comments, only: :create
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
