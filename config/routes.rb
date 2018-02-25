Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :batches
  #   resources :students do
  #     resources :evaluations
  #   end
  # end

  get "batches"   => "batches#index"
  get "batches/new" => "batches#new"
  get "batches/:id" => "batches#show"
  # get "batches/:id" => "students#index"
  post "batches" => "batches#create"
  delete "batches/:id" => "batches#create"
  #
  # get "students"          => "students#index"
  # get "students/new"      => "students#new"
  # get "students/:id/edit" => "students#edit"
  # get "students/:id"      => "students#show"
  # post "students"       => "students#create"
  # patch "students/:id"  => "students#update"
  # delete "students/:id" => "students#destroy"
  #
  # get "evaluations"     => "students#create_evaluation"
  # get "evaluations/:id" => "students#create_evaluation"
  # post "evaluations/:id" => "students#create_evaluation"
  # patch "evaluations/:id" => "students#update_evaluation"

end
