Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :lessons
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'home/index'
  get 'home/activity'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
