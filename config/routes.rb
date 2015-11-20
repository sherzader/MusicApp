Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  # users/1/cats <-- nested resources, only :index
  # /cats
  resource :sessions, only: [:create, :new, :destroy]
  resources :bands
  resources :bands, only: [:show] do
    resources :albums, only: [:new]
  end

  resources :albums
    # resources :albums, only: [:create] do
      # resources :tracks, only: [:new]
    # end
  # end
  
  # resources :bands, except: [:show]
  # resources :albums, except: [:create]
  resources :tracks
end
