Rails.application.routes.draw do
  root 'requests#start'
  devise_for :users

  resources :requests, except: [:new, :update, :edit] do
    collection do
      get :start
    end
  end
  resources :agreements do
    member do
      get :repair
    end
    collection do
      get :in_repair
    end
  end

  resources :analytics, only: :index do
    collection do
      get :requests
      get :agreements
      get :users
    end
  end
end
