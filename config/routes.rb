Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  get "batches/new" => "batches#new"
  get "batches/:id" => "students#index", as: 'batch_students'
  resources :batches

  get "students/new" => "students#new"
  get "students/:id" => "evaluations#index", as: 'student_evaluations'
  resources :students

  resources :evaluations

end
