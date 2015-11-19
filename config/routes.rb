Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resources :session, only: [:create, :new, :destroy]
end
