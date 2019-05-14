Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace :api, format: 'json' do
    resources :test, only: [:index, :create, :update]
    resources :room, only: [:index, :create]
    resources :user, only: [:index]
    resources :message, only: [:index, :create]
    mount ActionCable.server => '/cable'
  end
end
