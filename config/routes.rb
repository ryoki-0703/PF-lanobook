Rails.application.routes.draw do
  resources :categories
  get '/search' => 'search#search'
  root to: 'homes#top'
  devise_for :users

  resources :lanobes do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
