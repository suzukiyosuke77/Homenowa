Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :approve, :destroy] do
      member do
        patch :approve
      end
    end
  end
  
  get 'posts/ranking', to: 'posts#ranking', as: :post_ranking
  
  devise_for :users
  
  resources :users, only: [:show, :edit, :update] 
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :searches, only: [] do
    collection do
      get :search
    end
  end
  root "homes#top"
end