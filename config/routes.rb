Rails.application.routes.draw do
  resources :collections, except: :edit do
    resources :tracks, only: :index
    resources :releases, only: :index
  end

  resources :releases, only: [:index, :show, :update] do
    resources :tracks, only: :index
    resources :releases, only: :index
    resource :artwork, only: :show
    post :lookup, on: :collection
  end

  resources :tracks, only: :show

  resources :artists, only: [:index, :show, :update] do
    post :fetch, on: :member
    resources :releases, only: :index
    resources :tracks, only: :index
    resources :similar_artists, only: [:index]
  end

  resources :labels, only: [:index, :show, :update] do
    resources :artists, only: :index
    resources :releases, only: :index
  end

  resources :genres, only: [:index, :show, :update] do
    resources :artists, only: :index
    resources :releases, only: :index
  end

  resources :sources do
    post :scan, on: :collection
  end

  resources :files, only: :index

  get "/templates/:path", to: "templates#show", constraints: {path: /.*/}

  root to: "templates#index"
end
