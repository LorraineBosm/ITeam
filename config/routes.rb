Rails.application.routes.draw do
  root 'requests#start'
  devise_for :users

  resources :requests
end
