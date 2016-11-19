Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: "users/registrations", sessions: "users/sessions" }

  get "/routes", to: "routes#index"
  get "/routes/:id" , to: "routes#show"
end
