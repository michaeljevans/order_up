Rails.application.routes.draw do
  get '/dishes/:id', to: 'dishes#show'

  get '/chefs/:id',                  to: 'chefs#show'
  get '/chefs/:chef_id/ingredients', to: 'chefs#ingredients'
end
