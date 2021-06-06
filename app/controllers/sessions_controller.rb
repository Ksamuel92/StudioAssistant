class SessionController < ApplicationController
get '/signup' do

    erb :"registration/signup"
    end
    
      post "/signup" do
        user = User.new(:name => params[:name], :email => params[:email], :location => params[:location], :password => params[:password])
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
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/recordingsessions"
        else
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