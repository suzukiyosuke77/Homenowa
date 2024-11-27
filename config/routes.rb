Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :post_images
  get "search" => "searches#search"
  root "homes#top"
end
