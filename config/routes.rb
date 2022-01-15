Rails.application.routes.draw do
  resources :users

  resources :books do
    resources :reviews, only: [:create, :update]
  end



  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"

 # match '/auth/:google_oauth2/callback' => 'sessions#omniauth', via: [:get,:post]

  get '/auth/:provider/callback' => 'sessions#omniauth'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

