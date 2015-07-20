Rails.application.routes.draw do
  devise_for :users
  
  resources :tickets do
    resources :comments
    collection do
      get :express
    end
  end
  
  root 'tickets#index'
end
