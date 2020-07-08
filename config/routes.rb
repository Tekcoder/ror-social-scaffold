Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  post 'user/sendrequest/:id', to: 'users#forward_request', as: 'sendrequest'
  post 'user/receiverequest/:id', to: 'users#receive_request', as: 'receiverequest'

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
