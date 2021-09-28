Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"

  get "/admin/movies" => "admin/movies#index"
  get "/admin/movies/new" => "admin/movies#new"
  post "/admin/movies" => "admin/movies#create"
  get "/admin/movies/:id/edit" => "admin/movies#edit"
  patch "/admin/movies/:id" => "admin/movies#update"
  put "/admin/movies/:id" => "admin/movies#update"
  delete "/movies/:id" => "admin/movies#destroy"

  get "/sheets" => "sheets#index"
end
