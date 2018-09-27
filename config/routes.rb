Rails.application.routes.draw do
  get "sessions", to: "sessions#new"
  post "sessions", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
  resources :venerations

  root to: "home#index"
end
