# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :time_slots
  resources :users

  get "/registration/:token", to: "registration#show", as: :registration
  put "/registration/:token/:time_slot_id", to: "registration#register", as: :register
  delete "/registration/:token/:time_slot_id", to: "registration#cancel", as: :cancel
  put "/registration/:token/:selected_time_slot_id/:conflict_time_slot_ids", to: "registration#register_conflict_time_slot", as: :register_conflict_time_slot
  get "/export/:date", to: "export#index", as: :index

  root to: redirect("/users"), via: :all
end
