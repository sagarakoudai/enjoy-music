Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :edit, :update]
  resources :songs do
    resources :comments, only: [:create, :destroy]
    resource :favorites,only: [:create, :destroy]
  end

  get 'favorites/:user_id' => 'favorites#index', as: "favorites"

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'follow/:user_id/index' => 'relationships#follow_index', as: 'follow_index'
  get 'follower/:user_id/index' => 'relationships#follower_index', as: 'follower_index'

end
