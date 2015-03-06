Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'static_pages#home'
  resources :users
end
