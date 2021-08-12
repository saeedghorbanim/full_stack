Rails.application.routes.draw do
  
  root 'rpgs#index'
  
  post "/proceed" => 'rpgs#new'
end
