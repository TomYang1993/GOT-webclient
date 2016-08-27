Rails.application.routes.draw do
  get '/characters' => 'characters#index'
  get '/characters/new' => 'characters#new'
  get '/characters/:id' => 'characters#show'
  post '/characters' => 'characters#create'
  get '/characters/:id/edit' => 'characters#edit'
  patch '/characters/:id' => 'characters#update'
  delete '/characters/:id' => 'characters#destroy'
end
