Rails.application.routes.draw do

  get '/', to: 'shelters#index'

  #shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/:id', to: 'shelters#show'
end
