Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  # users/1/cats <-- nested resources, only :index
  # /cats
  resource :sessions, only: [:create, :new, :destroy]
end
