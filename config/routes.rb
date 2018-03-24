Rails.application.routes.draw do
  root 'requests#start'
  devise_for :users

  resources :requests, except: [:new, :update, :edit] do
    collection do
      get :start
    end
  end
end
