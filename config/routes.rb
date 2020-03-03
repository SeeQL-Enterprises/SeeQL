Rails.application.routes.draw do
  resources :databases, only: [:show]
  devise_for :users
  resources :projects, only: [:new, :create, :show]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
