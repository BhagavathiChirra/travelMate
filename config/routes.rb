Rails.application.routes.draw do


  root to: "pages#home"
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  get "/pages" => "pages#home"

  get "/comments/:id" => "comments#index"


  resources :cities
  resources :posts
  resources :users
  resources :photos
end
