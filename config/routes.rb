Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  get 'relationships/:user_id/followers' => 'relationships#followers', as: 'followers'
  get 'relationships/:user_id/following' => 'relationships#following', as: 'following'
  get 'searches/search' => 'searches#search', as: 'search'
  post 'users/:user_id/post_date' => 'users#post_date', as: 'post_date'
  get 'direct_messages/:user_id/message' => 'direct_messages#message', as: 'message'

  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    resource :direct_message, only: [:create]
  end
  
  devise_scope :user do
    post 'user/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
end
