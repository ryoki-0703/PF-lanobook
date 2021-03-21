Rails.application.routes.draw do
  resources :categories
  get '/search' => 'search#search'
  root to: 'homes#top'
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :lanobes, param: :id do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
end
