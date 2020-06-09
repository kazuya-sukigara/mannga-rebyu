Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  root 'manngas#index'
  devise_for :admins
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
  member do
  get :following, :followers
  end
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :manngas, only: [:index, :show] do
  resources :posts, only: [:new,:index,:create,:destroy]
  resource  :favorites, only: [:create, :destroy]
  end

  resources :contacts, only: [:new,:create]
  get 'genres/:id' => 'genres#show', as: 'genre_show'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :manngas, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]

  end
end
