Rails.application.routes.draw do



  # Routes for the Activity resource:
  # CREATE
  get "/activities/new", :controller => "activities", :action => "new"
  post "/create_activity", :controller => "activities", :action => "create"

  # READ
  get "/activities", :controller => "activities", :action => "index"
  get "/activities/:id", :controller => "activities", :action => "show"

  # UPDATE
  get "/activities/:id/edit", :controller => "activities", :action => "edit"
  post "/update_activity/:id", :controller => "activities", :action => "update"

  # DELETE
  get "/delete_activity/:id", :controller => "activities", :action => "destroy"
  #------------------------------

  # Routes for the Trip resource:
  # CREATE
  get "/trips/new", :controller => "trips", :action => "new"
  post "/create_trip", :controller => "trips", :action => "create"

  # READ
  get "/trips", :controller => "trips", :action => "index"
  get "/trips/:id", :controller => "trips", :action => "show"

  # UPDATE
  get "/trips/:id/edit", :controller => "trips", :action => "edit"
  post "/update_trip/:id", :controller => "trips", :action => "update"

  # DELETE
  get "/delete_trip/:id", :controller => "trips", :action => "destroy"
  #------------------------------



  # Routes for the Participant resource:
  # CREATE
  get "/participants/new", :controller => "participants", :action => "new"
  post "/create_participant", :controller => "participants", :action => "create"

  # READ
  get "/participants", :controller => "participants", :action => "index"
  get "/participants/:id", :controller => "participants", :action => "show"
  get "/my_participants", :controller => "participants", :action => "my_participants"

  # UPDATE
  get "/participants/:id/edit", :controller => "participants", :action => "edit"
  post "/update_participant/:id", :controller => "participants", :action => "update"

  # DELETE
  get "/delete_participant/:id", :controller => "participants", :action => "destroy"
  #------------------------------



  devise_for :users

  # home pages
  root 'trips#index'

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
