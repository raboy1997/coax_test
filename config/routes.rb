Rails.application.routes.draw do
  root 'bicycles#index'

  devise_for :users
  resources :bicycles  do
    post :use, on: :member
  end

  resources :suggestions do
    put :merge
  end

  namespace :users do
    resources :bicycles
  end

end
