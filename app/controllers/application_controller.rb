require './config/environment'

class ApplicationController < Sinatra::Base
  helpers Sinatra::Param

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_sauce"
  end

  get "/" do
    erb :index
  end

  not_found do
    status 404
    erb :error
  end




helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end

    def log_out
      session.delete(:user_id)
      redirect to "/"
    end
  
    def remove_comma_from_integer(integer)
      integer.gsub!(/[,]/,"")
    end

    

    def can_edit?
      if  @current_user != RecordingSession.find(params[:id]).user
        redirect to "/recording_sessions"
        #error message?
      end
  end
end

end
