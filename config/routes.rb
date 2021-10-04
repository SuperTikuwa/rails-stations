Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 映画関係(一般向け)
  get "/movies" => "movies#index"
  delete "/movies/:id" => "admin/movies#destroy"
  # 映画関係(管理者向け)

  get "/admin/movies" => "admin/movies#index"
  post "/admin/movies" => "admin/movies#create"

  get "/admin/movies/new" => "admin/movies#new"

  put "/admin/movies/:id" => "admin/movies#update"
  patch "/admin/movies/:id" => "admin/movies#update"

  get "/admin/movies/:id/edit" => "admin/movies#edit"

  # スケジュール関係(管理者向け)
  get "/movies/:id" => "movies#show"
  get "/admin/movies/:id" => "admin/movies#show"

  get "/admin/schedules" => "admin/schedules#index"
  get "/admin/schedules/:id" => "admin/schedules#edit"

  get "/admin/movies/:id/schedules/new" => "admin/schedules#new"
  post "/admin/movies/:id/schedules" => "admin/schedules#create"

  get "/admin/movies/:movie_id/schedules/:id" => "schedules#edit"
  delete "/schedule/:id" => "schedules#destroy"
  put "/schedule/:id" => "schedules#update"

  # シート関係
  get "/sheets" => "sheets#index"
  get "/movies/:movie_id/schedules/:schedule_id/sheets" => "sheets#show"

  #予約関係
  get "/movies/:movie_id/schedules/:schedule_id/reservations/new" => "reservations#new"
  post "/reservation" => "reservations#create"

  # テスト用
  get "/hoge" => "hoges#index"
end
