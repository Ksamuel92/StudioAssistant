class SessionController < ApplicationController
get '/signup' do

    erb :"sessions/signup"
    end
    
      post "/signup" do
        params[:email].downcase
        user = User.new(params)
        if !user.save
          flash[:error] = "Make sure to fill the required fields and that your email address hasn't been used already."
          redirect to "/signup"
        else
          user.save
          session[:user_id] = user.id
          redirect to "/recordingsessions"
        end
      end
    
      get "/login" do
    
        erb :"sessions/login"
      end
    
      post "/login" do
        params[:email].downcase
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/recordingsessions"
        else
          flash[:error] = "Doublecheck your username and password."
          redirect to "/login"
          #error message?
        end
      end
    
      get "/logout" do
      session.delete(:user_id)
          redirect to "/"
      end

      helpers do

      def log_out
        session.delete(:user_id)
        redirect to "/"
      end
    
    end
end