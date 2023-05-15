Rails.application.routes.draw do
  root 'anomalys#index'
  get 'home/index'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :anomalys do
    resources :comments, only: [:create]
  end
  get "search_tag"=>"anomalys#search_tag"
  resources :comments, only: :destroy
end
