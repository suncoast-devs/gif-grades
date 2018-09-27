Rails.application.routes.draw do
  get "sign_in", to: redirect("/auth/#{Rails.env.production? ? :github : :developer}")
  get "sign_out", to: "sessions#destroy"
  get "auth/failure", to: redirect("/")
  match "auth/:provider/callback", to: "sessions#create", via: %i[get post]

  get "gifs/:score", to: "gifs#index"
  resources :venerations
  root to: "home#index"
end
