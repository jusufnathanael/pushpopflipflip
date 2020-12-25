Rails.application.routes.draw do
  
  devise_for :users
  get 'pages/info'

  get '/items/all', to: 'items#index_all'
  get '/items/current', to: 'items#index_current'
  get '/items/finished', to: 'items#index'

  get '/users/list', to: 'home#users'

  resources :workspaces do
    member do
      patch :move
    end
    get 'next', action: :next, controller: 'workspaces'
    get 'previous', action: :previous, controller: 'workspaces'
    resources :items do
      get 'next', action: :next, controller: 'items'
      get 'previous', action: :previous, controller: 'items'
      resources :dues
    end
  end

  root to: 'home#index'

end