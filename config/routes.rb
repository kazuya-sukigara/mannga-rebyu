Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  get 'contacts/new'
  get 'contacts/create'
  root 'manngas#index'
  get 'searchs/search', to:'search#search'
  get '/post/hashtag/:name', to: "manngas#hashtag"
  devise_for :admins
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :edit, :update] do
  member do
  get :following, :followers
  end
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :manngas, only: [:index, :show] do
  resources :posts, only: [:new,:index,:create,:destroy, :edit, :update]
  resource  :favorites, only: [:create, :destroy]
  end

  resources :contacts, only: [:new,:create]
  get 'genres/:id' => 'genres#show', as: 'genre_show'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :manngas, only: [:index, :new, :create, :show, :edit, :update] do
       #Ajaxで動くアクションのルートを作成
    collection do
      get 'genre_children', defaults: { format: 'json' }
    resources :genres, only: [:index, :create, :edit, :update]
    end
    end
  end
end
