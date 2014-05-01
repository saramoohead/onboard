Rails.application.routes.draw do
 
   # we want to add the ability to create, update, delete and view rooms
   resources :rooms

   resources :users

   # log in and log out (but only one log in at a time)
   # a singluar resource, because we only want this to happen once
   # another singular resource is account, profile, settings - each user only has one of these
   # so only resource, without the s
   resource :session

   # the home page is the list of rooms
   root "rooms#index"

end

