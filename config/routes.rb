Rails.application.routes.draw do
  root 'anomalys#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :anomalys do
    resources :comments, only: [:create]
  end
  get "search_tag"=>"anomalys#search_tag"
end
