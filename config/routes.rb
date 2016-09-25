Rails.application.routes.draw do
  resources :dashboards, only: :show
  resources :events, only: [:new, :create]
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: 'home#index'
end
