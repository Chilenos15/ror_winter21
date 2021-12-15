Rails.application.routes.draw do

  # no longer for navigation 
  # api end points, a way to get to the controller 
  # always have this do loop
  namespace :api do 
    # rest of your routes will go here
    resources :todos
    # resources :todos do
    #   resources :comments
    # end

    # resources :comments do
    #   resources :authors
    # end

  end
end