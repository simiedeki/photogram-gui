Rails.application.routes.draw do
get '/users', to: 'users#index'
get '/users/:username', to: 'users#show'
get '/', to: 'users#index'
get '/photos', to: 'photos#index'
get '/photos/:path_id', to: 'photos#show'
get '/delete_photo/:path_id', to: 'photos#delete'
get '/delete_photo/:path_id', to: 'photos#delete'
post("/add_user", { :controller => "users", :action => "create" })
post("/insert_photo_record", { :controller => "photos", :action => "create" })
post("/update_user/:path_id", { :controller => "users", :action => "update" })
post("/update_photo/:path_id", { :controller => "photos", :action => "update" })
end
