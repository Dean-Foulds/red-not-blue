Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'posts#index'
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:show, :edit, :update, :create, :destroy]
  end
end
