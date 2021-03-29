# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :time_slots
  resources :users

  get "/registration/:token", to: "registration#show", as: :registration
  put "/registration/:token/:time_slot_id", to: "registration#register", as: :register
  delete "/registration/:token/:time_slot_id", to: "registration#cancel", as: :cancel

  root to: redirect("/users"), via: :all
end
