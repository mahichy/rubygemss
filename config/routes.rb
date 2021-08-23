Rails.application.routes.draw do
  resources :enrollments
  devise_for :users
  resources :courses do
    get :purchased, :pending_review, on: :collection
    resources :lessons
    resources :enrollments, only: [:new, :create]
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'home/index'
  get 'activity', to: "home#activity"
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
