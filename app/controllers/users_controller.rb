class UsersController < ApplicationController

  get "/users/:id" do
    # binding.pry
    current_user
    can_view_profile?
    @user = User.find_by_id(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    current_user
    if @user != User.find_by_id(params[:id])
      flash[:error] = 'You are not authorized to edit this profile! Play nice.'
      redirect to "/users/#{@user.id}"
    end
    @user = User.find_by_id(params[:id])
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    # binding.pry
    current_user
    if @user != User.find_by_id(params[:id])
      flash[:error] = 'You are not authorized to edit this profile! Play nice.'
      redirect to "/users/#{@user.id}"
    end
    @user.update(params[:user])
    @user.save
    # binding.pry
    redirect "/users/#{@user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    user = User.find_by_id(params[:id])
    user.delete
    log_out
  end
end