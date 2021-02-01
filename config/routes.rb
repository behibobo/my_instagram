Rails.application.routes.draw do
  post 'upload', to: "uploader#create"
  post 'avatar', to: "uploader#avatar"
  get 'profile', to: "users#profile"
  resources :posts
  get "/users", to: "users#index"
  post "/login", to: "users#login"
  post "/register", to: "users#create"
  get '/', to: 'home#index'
  get '/direct_messages', to: "direct_messages#index"
  post '/direct_messages', to: "direct_messages#create"
end
