Rails.application.routes.draw do
  resources :messages, only: [:index, :new, :create, :show]

  root to: 'users#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  match '/auth/logout'
  get 'auth/facebook/callback', to: 'users#login'
end
