Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :challenges, :path => "desafios" do
    resources :bets, :path => "convites"
    resources :progresses, :path => "progressos"
  end

  # post "desafios/:challenge_id/convites/:id", to: "bets#confirm_bet", as: :confirm_bet

  resources :notifications, only: [:index, :update]

  # post "api/v1/notifications/:id", to: "notifications#mark_as_read", as: :mark_as_read

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :notifications, only: [:index, :update]
      resources :users, only: [:index]
      resources :challenges, only: [ :index, :show, :update, :create, :destroy ] do
        resources :bets, only: [ :index, :show, :update, :create, :destroy ]
      end
    end
  end
end
