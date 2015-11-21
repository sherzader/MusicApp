Rails.application.routes.draw do
  root to: redirect("/session/new") #bands index

  resources :users, only: [:create, :new, :show]
  # users/1/cats <-- nested resources, only :index
  # /cats
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:new, :index]
end
