Rails.application.routes.draw do
  get "sessions", to: "sessions#new"
  post "sessions", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
  get "gifs/:score", to: "gifs#index"
  resources :venerations
  root to: "home#index"
end
