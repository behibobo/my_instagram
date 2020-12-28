Rails.application.routes.draw do
  post 'upload', to: "uploader#create"
  post 'avatar', to: "uploader#avatar"
  get 'profile', to: "users#profile"
  resources :posts
  post "/login", to: "users#login"
  post "/register", to: "users#create"
  get '/', to: 'home#index'
end
