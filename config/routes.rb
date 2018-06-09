Rails.application.routes.draw do

  root to: "pages#home"
    get "/login" => "session#new"
    post "/login" => "session#create"
    delete "/login" => "session#destroy"

    get "/pages" => "pages#home"




  resources :cities
end
