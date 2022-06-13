Rails.application.routes.draw do
  root 'users#show'
  get "users/show" => "users#show"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
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
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
