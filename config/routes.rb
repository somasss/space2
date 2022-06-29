Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'top#index'
  get "users/show" => "users#show"
  get "users/index" => "users#index" 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users do 
    post 'sing_in' => user_session
  end
  resources :relationships, only: [:create, :destroy]
  resources :tasks do
    collection do
      get 'search'
    end
  end
  resources :notes do 
    collection do
      get 'search'
    end
  end
  resources :beats do 
    collection do
      get 'search'
    end
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
