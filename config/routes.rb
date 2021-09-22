Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies" => "movies#index"
  get "/admin/movies" => "admin/movies#index"
  get "/admin/movies/new" => "admin/movies#new"
  post "/admin/movies/new" => "admin/movies#create"
end
