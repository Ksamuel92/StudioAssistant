require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_sauce"
  end

  get "/" do
    erb :index
  end

  get "/signup" do

    erb :"registration/signup"
  end

  post "/signup" do
    user = User.new(:name => params[:name], :email => params[:email], :location => params[:location], :password => params[:password])
    if !user.save
      redirect to "/signup"
      #flash error message??
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
    redirect to "/recording_sessions"
    else
      redirect to "/login"
      #error message?
    end
  end

  get "/logout" do
    log_out
  end


helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end

    def can_edit?
      if  @current_user != RecordingSession.find(params[:id]).user
        redirect to "/recording_sessions"
        #error message?
      end
    end


    def log_out
      session.delete(:user_id)
      redirect to "/"
    end
end

end
