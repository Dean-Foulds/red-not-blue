Rails.application.routes.draw do

  resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments, only: [:show, :edit, :update, :create, :destroy]
  end
  get '/profile', to: 'profiles#show', as: :profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile

  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"

end

