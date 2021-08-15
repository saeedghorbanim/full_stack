Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  root 'dojos#index'
  get "/dojos/new" => "dojos#new"
  get "/dojos/:id" => "dojos#show"
  get "/dojos/:id/edit" => "dojos#edit"
  put "dojos/:id" => "dojos#update"
  post '/dojos' => 'dojos#create'
  delete "dojos/:id" => "dojos#destroy"
   


end
