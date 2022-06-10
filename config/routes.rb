Rails.application.routes.draw do
  resources :tasks
  resources :notes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :beats
  root 'beats#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
