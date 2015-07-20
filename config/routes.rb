Rails.application.routes.draw do
  devise_for :users
  resources :tickets do
    collection do
      get :express
    end
  end
  root 'tickets#index'
end
