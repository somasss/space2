Rails.application.routes.draw do
  root 'top#index'
  get "users/show" => "users#show"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users do 
    post 'sing_in' => user_session
  end
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
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
