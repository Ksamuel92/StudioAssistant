require './config/environment'

class ApplicationController < Sinatra::Base
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('session_secret')
    register Sinatra::Flash
    set :show_expectations, false
  end

  get '/' do
    erb :index
  end
  not_found do
    status 404
    erb :"404"
  end

helpers do

  def can_edit?
      current_user
    if @user != RecordingSession.find(params[:id]).user
      flash[:error] = 'You are not authorized to edit this session! Play nice.'
      redirect to '/recordingsessions'
    end
  end

  def can_edit_profile?
    current_user
    if @user != User.find_by_id(params[:id])
      flash[:error] = 'You are not authorized to edit this profile! Play nice.'
      redirect to "/users/#{@user.slug}"
    end
  end

  def can_view?
    current_user
    if @user != RecordingSession.find_by_id(params[:id]).user
      flash[:error] = 'You are not authorized to view that session!'
      redirect to '/recordingsessions'
    end
  end

  def can_view_profile?
    current_user
    
    if current_user != User.find_by_id(params[:id])
      flash[:error] = 'You are not authorized to view that profile!'
      redirect to '/recordingsessions'
    end
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if validate_login
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
        flash[:error] = 'Something went wrong! Check your URL and try again.'
        redirect to '/recordingsessions'
      end
    end


    def validate_login
      !!session[:user_id]
    end

    def validate_dates
     if params[:recording_session][:end_date] < params[:recording_session][:start_date]
      flash[:error] = 'Your end date needs to be after your start date!'
      redirect to '/recordingsessions/new'
     end
    end
  end
end