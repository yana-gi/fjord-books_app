Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  resources :users do
    member do
      get :'followings', to: 'users/followings#index'
      get :'followers', to: 'users/followers#index'
    end
  end
  resources :relationships, only: [:create, :destroy]
end
