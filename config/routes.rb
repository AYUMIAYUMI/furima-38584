Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :new, :create]
  resources :users, only: [:create]

  root to: "items#index"
  get 'users/new' => 'users#new'

  
end
