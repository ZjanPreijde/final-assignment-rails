Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  get "batches"   => "batches#index"
  get "new_batch" => "batches#new_batch"
  get "create_batch" => "batches#create_batch"
  # get "batch_stats" => "batches#match_stats"

  get "students"  => "students#index"
  get "new_student" => "students#new_student"
  get "create_student" => "students#create_student"
  get "edit_student" => "students#edit_student"
  get "update_student" => "students#update_student"
  get "delete_student" => "students#delete_student"

  get "create_evaluation" => "students#create_evaluation"
  get "update_evaluation" => "students#update_evaluation"

  # get "users" => "users#index"
  # get "toggle_admin" => "users#toggle_admin"

end
