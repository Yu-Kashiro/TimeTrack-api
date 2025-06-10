Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/custom_sessions'
  }

  namespace :auth do
    resources :sessions, only: [:index]
  end

  get '/work_times', to: 'work_times#index'
  post '/work_times', to: 'work_times#create'
  put '/work_times', to: 'work_times#update'
  get '/work_times/:id', to: 'work_times#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
