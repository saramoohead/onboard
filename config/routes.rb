Rails.application.routes.draw do
 
   # we want to add the ability to create, update, delete and view rooms
   resources :rooms

   resources :users

   # the home page is the list of rooms
   root "rooms#index"

end

