class UsersController < ApplicationController

  get "/users/:slug" do
    # binding.pry
    can_view_profile?
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:slug/edit" do
    current_user
    if @user != User.find_by_slug(params[:slug])
      flash[:error] = 'You are not authorized to edit this profile! Play nice.'
      redirect to "/users/#{@user.slug}"
    end
    # @user = User.find_by_slug(params[:slug])
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:slug" do
    # binding.pry
    current_user
    if @user != User.find_by_slug(params[:slug])
      flash[:error] = 'You are not authorized to edit this profile! Play nice.'
      redirect to "/users/#{@user.slug}"
    end
    @user.update(params[:user])
    @user.save
    # binding.pry
    redirect "/users/#{@user.slug}"
  end

  # DELETE: /users/5/delete
  delete "/users/:slug/delete" do
    user = User.find_by_slug(params[:slug])
    user.delete
    log_out
  end
end