Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show] do
  resources :posts, only: [:new,:index,:create,:destroy]
  end
  get 'genres/:id' => 'genres#show', as: 'genre_show'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :manngas, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
