Rails.application.routes.draw do
  post 'upload', to: "uploader#create"
  resources :posts
  post "/login", to: "users#login"
  post "/register", to: "users#create"
  get '/', to: 'home#index'
end
