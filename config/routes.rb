Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :challenges, :path => "desafios" do
    resources :bets, :path => "convites"
    resources :progresses, :path => "progressos"
  end

  #get "api/v1/users", to: "users#index", as: :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
      resources :challenges, only: [ :index, :show, :update, :create, :destroy ] do
        resources :bets, only: [ :index, :show, :update, :create, :destroy ]
      end
    end
  end
end
