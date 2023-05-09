Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  get 'books/show'
  get 'books/edit'
  get 'books/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
