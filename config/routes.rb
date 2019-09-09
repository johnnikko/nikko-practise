Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  namespace :admin do
    resources :employees
    resources :movies do
      resources :issues
    end
  end

  resources :transactions do
    resources :customers, only: [:index]
  end

  resources :customers do
    resources :transactions, only: [:index]
  end

  resources :rented_movies do
    resources :transactions, only: [:index]
  end


end
