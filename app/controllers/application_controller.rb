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

  def current_user
    @user ||= User.find_by(id: session[:user_id])
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

  end
end
