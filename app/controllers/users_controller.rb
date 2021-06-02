class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

  # GET: /users/5
  get "/users/:slug" do
    #should grab user profile page
    #slug should be user's name
    #profile page should show name, location, and email (unless user has set email to private??)
    #if user page is their own, they should be able to edit or delete.
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:slug/edit" do
    #this page should only go to the LOGGED IN user's profile to edit
    #user can edit their profile information
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:slug" do
    #patches profile page
    redirect "/users/:slug"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
