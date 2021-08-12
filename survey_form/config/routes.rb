Rails.application.routes.draw do

  #this renders to localhost:3000 and connects to the index method in controllers
  root 'dojos#index'

  get '/dojos/result' => 'dojos#result'
  post '/dojos' => 'dojos#create'

end
