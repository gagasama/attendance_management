AttendanceManagement::Application.routes.draw do

  get "work_day/new"

  get "non_work_day/create"

  get "work_day/create"

  get "user/index"
  root :to => "user#show"
  #end
  match "/auth/google_login/callback" => "user/sessions#create"
  match "/signout" => "user/sessions#destroy", :as => :signout
  post "user/clock_in"
  post "user/clock_out"
end
