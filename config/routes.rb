Rails.application.routes.draw do
  root 'requests#start'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :requests, except: [:new, :update, :edit] do
    collection do
      get :start
    end
  end
  resources :agreements do
    member do
      get :start_repair
      get :additional_device_info
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

  resources :profiles, only: [] do
    collection do
      get :my_profile
      post :add_agreement
    end
  end
end
