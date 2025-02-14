Rails.application.routes.draw do

  get 'reports/create'
  get 'reports/index'
  get 'reports/destroy'
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :approve, :destroy] do
      member do
        get :approve
        patch :approve
      end
    end
  end
  
  get 'posts/ranking', to: 'posts#ranking', as: :post_ranking
  get 'tagsearches', to: 'tagsearches#search', as: :tag_search
  
  devise_for :users
  
  resources :users 
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
      collection do
        
      end
  end
  resources :searches, only: [] do
    collection do
      get :search
    end
  end
  root "homes#top"
  get 'about', to: 'homes#about', as: :about
end