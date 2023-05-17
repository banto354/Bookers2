Rails.application.routes.draw do

  get 'searches/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  get 'relationships/:user_id/followers' => 'relationships#followers', as: 'followers'
  get 'relationships/:user_id/following' => 'relationships#following', as: 'following'
  
  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
  end
  
end
