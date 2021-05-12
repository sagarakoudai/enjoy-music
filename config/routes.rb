Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :edit, :update]
  resources :songs do
    resources :comments, only: [:create, :destroy]
    resources :favorites,only: [:index, :create, :destroy]
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'follow/:id/index' => 'relationships#follow_index', as: 'follow_index'
  get 'follower/:id/index' => 'relationships#follower_index', as: 'follower_index'

end
