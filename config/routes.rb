Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts
  resources :post_images
  root "homes#top"
  get 'tagsearches/search', to: 'tagsearches#search'
end
