Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :players, only: [:new, :create, :index, :destroy]
  end
  resources :players, only: [:update]
  resources :searchs, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
