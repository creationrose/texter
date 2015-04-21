Rails.application.routes.draw do
  resources :messages, only: [:index, :new, :create, :show]

  root to: 'users#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'
end
