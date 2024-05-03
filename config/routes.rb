Rails.application.routes.draw do
get '/users', to: 'users#index'
get '/users/:username', to: 'users#show'
get '/', to: 'users#index'
get '/photos', to: 'photos#index'
get '/photos/:path_id', to: 'photos#show'

end
