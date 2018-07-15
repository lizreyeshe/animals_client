Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :client do

    #animals
    get "/animals" => "animals#index"
    
    get "/animals/:id" => "animals#show"

    
    #questions
    get "/questions/" => "questions#index"

    get "questions/new" => "questions#new"

    post "/questions" => "questions#create"

    get "/questions/:id" => "questions#show"

    get "/questions/:id/edit" => "questions#edit"

    patch "/questions/:id" => "questions#update"

    delete "/questions/:id" => "questions#destroy" 

    #answers 
    get "/questions" => "questions#index"
    
    get "/answers/new" => "answers#new"

    post "/answers" => "answers#update"

    get "/answers/:id" => "answers#show"

    get "/answers/:id/edit" => "answers#edit"

    patch "answers/:id" => "answers#update"

    delete "/answers/:id" => "answers#destroy"

    #users
    get "/signup" => "users#new"
    post "/users" => "users#create"
    
    

  end

  post "/login" => "sessions#create"
  get "/login" => "sessions#new"
    delete "/logout" => "sessions#destroy"
end
