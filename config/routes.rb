Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :challenges do
    resources :bets
    resources :progresses
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :challenges, only: [ :index, :show, :update, :create, :destroy ] do
        resources :bets, only: [ :index, :show, :update, :create, :destroy ]
      end
    end
  end
end
