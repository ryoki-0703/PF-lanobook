Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  resources :lanobes, only: [:new, :create, :index, :show, :destroy]
end
