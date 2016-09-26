Rails.application.routes.draw do
  resources :dashboards, only: :show
  resources :events, only: [:new, :create]
  resources :memberships, only: [] do
    collection do
      get 'index'
      delete 'destroy'
    end
  end
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: 'home#index'
end
