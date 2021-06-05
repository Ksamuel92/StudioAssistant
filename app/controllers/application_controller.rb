require './config/environment'

class ApplicationController < Sinatra::Base
  # helpers Sinatra::Param
  # require Sinatra::Flas.

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_sauce" 
    register Sinatra::Flash
    # set :show_expectations, false 
  end

  get "/" do
    erb :index
  end
  
  not_found do
    status 404
    erb :"404"
  end

helpers do
  def can_edit?
    if current_user.name != RecordingSession.find_by_id(params[:id]).user.name
      flash[:error] = "You are not authorized to edit this session! Play nice."
      redirect to "/recordingsessions"
    end
  end

  def can_view?
    if current_user.name != RecordingSession.find_by_id(params[:id]).user.name
      flash[:error] = "You are not authorized to view that session!"
      redirect to "/recordingsessions"
    end
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
    end

  
    def log_out
      session.delete(:user_id)
      redirect to "/"
    end
  
    def remove_comma_from_integer(integer)
      integer.gsub!(/[,]/,"")
    end

    def set_recording_session_and_client
      @recording_session = RecordingSession.find_by_id(params[:id])
      @client = Client.find_by_slug(params[:slug])
      if !@recording_session || !@client
        redirect to "/"
        #error message
      end
    end


    def validate_login
      !!session[:user_id]
    end
  end
end