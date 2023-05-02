Rails.application.routes.draw do
  get "/schedules/index" => "schedules#index"
  get '/' => "home#top"
  get "/schedules" => "schedules#index"
  post "/schedules" => "schedules#create"
  get "/schedules/new" => "schedules#new"
  get "/schedules/:id/edit" => "schedules#edit"
  get "/schedules/:id" => "schedules#show"
  patch "/schedules/:id" => "schedules#update"
  put "/schedules/:id" => "schedules#update"
  delete "/schedules/:id" => "schedules#destroy"


  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
