Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :batches do
    resources :students do
      resources :evaluations
    end
  end

  # get "batches"   => "batches#index"
  # get "new_batch" => "batches#new_batch"
  # post "batches" => "batches#create_batch"
  #
  # get "students"        => "students#index"
  # get "students/:id"    => "students#show"
  # get "new_student"     => "students#new_student"
  # get "edit_student"    => "students#edit_student"
  # post "students"       => "students#create_student"
  # patch "students/:id"  => "students#update_student"
  # delete "students/:id" => "students#delete_student"
  #
  # get "evaluations"     => "students#create_evaluation"
  # get "evaluations/:id" => "students#create_evaluation"
  # post "evaluations/:id" => "students#create_evaluation"
  # patch "evaluations/:id" => "students#update_evaluation"

end
